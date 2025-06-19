module BeamForming #(
    parameter MICS = 6
)(
    input         CLK_50MHz,
    input         reset,
    output        pdm_clk,
    
    input  [MICS-1:0]  pdm_data,
    
    // Beamforming Control
    input  [10:0] beam_angle,    // 0-2047 (0°=0, 360°=2047)
    input         beam_enable,
    
    // PCM Output
    output [15:0] pcm_data,
    output        pcm_valid,
    
    // Direction of Arrival
    output [10:0] doa_estimate,  // 0-2047 (0-360°)
    output        doa_valid,
    
    // Status
    output [4:0]  led_status,
	 
	 // Display 7 segments
	 output [6:0] seg,    // Salida a segmentos (a-g)
	 output [3:0] an      // Salida a ánodos de displays
);

wire pll_locked;
pll_3M2Hz pll_inst (
    .areset(reset),
    .inclk0(CLK_50MHz),
    .c0(pdm_clk),
    .locked(pll_locked)
);

wire [7:0]  cic_out [MICS-1:0];
wire [25:0] fir_out [MICS-1:0];
wire        fir_valid [MICS-1:0];

// Instanciación del módulo de visualización
DOA_Display display_inst (
    .clk(CLK_50MHz),
    .reset(reset),
    .doa_angle(HY57V641620),
	 .beam_enable(beam_enable),
    .doa_valid(doa_valid),
    .seg(seg),
    .an(an)
);

genvar i, j;

generate
    for (i = 0; i < MICS; i = i + 1) begin : proc_chain
        CIC cic_inst (
            .in_error(2'b00),
            .in_valid(1'b1),
            .in_ready(),
            .in_data({1'b0, pdm_data[i]}),
            .out_data(cic_out[i]),
            .out_error(),
            .out_valid(),
            .out_ready(1'b1),
            .clk(pdm_clk),
            .reset_n(~reset)
        );
        
        LOW_PASS_FIR fir_inst (
            .clk(pdm_clk),
            .reset_n(~reset),
            .ast_sink_data(cic_out[i]),
            .ast_sink_valid(1'b1),
            .ast_sink_error(2'b00),
            .ast_source_data(fir_out[i]),
            .ast_source_valid(fir_valid[i]),
            .ast_source_error()
        );
    end
endgenerate

reg [15:0] pcm_buffer [MICS-1:0];
reg [2:0]  mic_counter = 0;
reg [31:0] cross_corr [MICS-1:0];
reg [31:0] max_corr = 0;
reg [10:0] est_angle = 0;
reg        doa_update = 0;

integer k;

always @(posedge pdm_clk) begin
    if (fir_valid[0]) begin
        pcm_buffer[mic_counter] <= fir_out[mic_counter][23:8];
        mic_counter <= (mic_counter == MICS-1) ? 0 : mic_counter + 1;
        
        if (mic_counter == MICS-1) begin
            max_corr <= 0;
            for (k = 1; k < MICS; k = k + 1) begin
                cross_corr[k] <= $signed(pcm_buffer[0]) * $signed(pcm_buffer[k]);
                
                if (cross_corr[k] > max_corr) begin
                    max_corr <= cross_corr[k];
                    est_angle <= k * 341;
                end
            end
            doa_update <= 1'b1;
        end else begin
            doa_update <= 1'b0;
        end
    end
end

wire [9:0] cos_theta;
cordic_cos cordic_inst (
    .clk(pdm_clk),
    .areset(reset),
    .a(beam_angle),
    .c(cos_theta),
    .s()
);

wire [MICS-1:0] delay_samples [MICS-1:0];
generate
    for (j = 0; j < MICS; j = j + 1) begin : delay_calc
        assign delay_samples[j] = (j * $signed(cos_theta) * 21 * 3200) / 343000;
    end
endgenerate

reg [15:0] beamformed_pcm;
reg [18:0] sum;

always @(posedge pdm_clk) begin
    if (fir_valid[0]) begin
        
        sum <= $signed({pcm_buffer[0][15], pcm_buffer[0]}) + 
               $signed({pcm_buffer[1][15], pcm_buffer[1]}) +
               $signed({pcm_buffer[2][15], pcm_buffer[2]}) +
               $signed({pcm_buffer[3][15], pcm_buffer[3]}) +
               $signed({pcm_buffer[4][15], pcm_buffer[4]}) +
               $signed({pcm_buffer[5][15], pcm_buffer[5]});
        
        // (sum + sum/8 + sum/64 + 3) >> 6
        beamformed_pcm <= (sum + 
                          (sum >>> 3) +
                          (sum >>> 6) +
                          3)
                        >>> 6;
    end
end

assign pcm_data = beam_enable ? beamformed_pcm : fir_out[0][23:8];
assign pcm_valid = (mic_counter == 0) & fir_valid[0];
assign doa_estimate = est_angle;
assign doa_valid = doa_update;

endmodule

module fifo_delay #(
    parameter WIDTH = 16,
    parameter MAX_DELAY = 48
)(
    input              clk,
    input              reset,
    input  [WIDTH-1:0] data_in,
    input              valid_in,
    input  [5:0]       delay,
    output [WIDTH-1:0] data_out,
    output             valid_out
);

reg [WIDTH-1:0] buffer [0:MAX_DELAY-1];
reg [4:0] wr_ptr = 0;

integer i;

always @(posedge clk) begin
    if (reset) begin
        wr_ptr <= 0;
        for (i = 0; i < MAX_DELAY; i = i + 1)
            buffer[i] <= 0;
    end 
    else if (valid_in) begin
        // Shift all entries
        for (i = MAX_DELAY-1; i > 0; i = i - 1)
            buffer[i] <= buffer[i-1];
        buffer[0] <= data_in;
        
        // Update pointer (unused in shift-register mode)
        wr_ptr <= (wr_ptr == MAX_DELAY-1) ? 0 : wr_ptr + 1;
    end
end

assign data_out = buffer[delay];
assign valid_out = valid_in; 

endmodule

module DOA_Display (
    input clk,               
    input reset,             
    input [10:0] doa_angle,  
	 input beam_enable,
    input doa_valid,         
    output reg [6:0] seg,    
    output reg [3:0] an      
);

reg [8:0] degrees;  // 9 bits para 0-359
always @(posedge clk) begin
    if (doa_valid) begin
        degrees <= (doa_angle * 360) / 2048; // Conversión a grados
    end
end
reg [15:0] display_value;

always @(posedge clk) begin
    if (reset) begin
        display_value <= 16'h0000;
    end else if (doa_valid) begin
        display_value[15:12] <= degrees / 100;
        display_value[11:8] <= (degrees % 100) / 10;
        display_value[7:4] <= degrees % 10;
		  display_value[3:0] <= (degrees % 10) * 10 / 16;

    end
end

reg [19:0] refresh_counter;
reg [1:0] digit_sel;

always @(posedge clk) begin
    if (reset) begin
        refresh_counter <= 0;
        digit_sel <= 0;
    end else begin
        refresh_counter <= refresh_counter + 1;
        if (refresh_counter == 50_000) begin
            refresh_counter <= 0;
            digit_sel <= digit_sel + 1;
        end
    end
end

always @(*) begin
    case (digit_sel)
        2'b00: begin
            an = 4'b1110;
            case (display_value[7:4])
                4'h0: seg = 7'b1000000; // 0
                4'h1: seg = 7'b1111001; // 1
                4'h2: seg = 7'b0100100; // 2
                4'h3: seg = 7'b0110000; // 3
                4'h4: seg = 7'b0011001; // 4
                4'h5: seg = 7'b0010010; // 5
                4'h6: seg = 7'b0000010; // 6
                4'h7: seg = 7'b1111000; // 7
                4'h8: seg = 7'b0000000; // 8
                4'h9: seg = 7'b0010000; // 9
                default: seg = 7'b1111111; // Apagado
            endcase
        end
        2'b01: begin
            an = 4'b1101; // Display 1 (decenas)
            case (display_value[11:8])
                4'h0: seg = 7'b1000000; // 0
                4'h1: seg = 7'b1111001; // 1
                4'h2: seg = 7'b0100100; // 2
                4'h3: seg = 7'b0110000; // 3
                4'h4: seg = 7'b0011001; // 4
                4'h5: seg = 7'b0010010; // 5
                4'h6: seg = 7'b0000010; // 6
                4'h7: seg = 7'b1111000; // 7
                4'h8: seg = 7'b0000000; // 8
                4'h9: seg = 7'b0010000; // 9
                default: seg = 7'b1111111;
            endcase
        end
        2'b10: begin
            an = 4'b1011; // Display 2 (centenas)
            case (display_value[15:12])
                4'h0: seg = 7'b1000000; // 0
                4'h1: seg = 7'b1111001; // 1
                4'h2: seg = 7'b0100100; // 2
                4'h3: seg = 7'b0110000; // 3
                default: seg = 7'b1111111;
            endcase
        end
		2'b11: begin
				an = 4'b0111; // Display 3
				if (beam_enable)
					seg = 7'b0001100; // Mostrar 'P' para beamforming activo
				else
					seg = 7'b0110001; // Mostrar ° para beamforming inactivo
				end
			endcase
		end
endmodule