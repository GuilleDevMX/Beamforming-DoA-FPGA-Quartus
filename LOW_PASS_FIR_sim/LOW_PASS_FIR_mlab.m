%
%THIS IS A WIZARD GENERATED FILE. DO NOT EDIT THIS FILE!
%
%---------------------------------------------------------------------------------------------------------
%This is a filter with fixed coefficients.
%This Model Only Support Single Channel Input Data.
%Please input:
%data vector: 		stimulation(1:n)

%    This Model Only Support FIR_WIDTH to 51 Bits

%FILTER PARAMETER
%Input Data Width: 8
%Interpolation Factor: 1
%Decimation Factor: 1
%FIR Width (Full Calculation Width Before Output Width Adjust) :26
%-----------------------------------------------------------------------------------------------------------
%MegaWizard Scaled Coefficient Values

function  output = LOW_PASS_FIR_mlab(stimulation, bank);
 coef_matrix_in= [144,108,0,-122,-186,-141,0,167,260,204,0,-263,-434,-368,0,614,1303,1842,2047,1842,1303,614,0,-368,-434,-263,0,204,260,167,0,-141,-186,-122,0,108,144];
 INTER_FACTOR  = 1;
 DECI_FACTOR  =  1;
 MSB_RM  = 0;
 MSB_TYPE  = 0;
 LSB_RM  = 0;
 LSB_TYPE  = 0;
 FIR_WIDTH  = 26 + MSB_RM + LSB_RM;
 OUT_WIDTH  = 26 ;  %26
 DATA_WIDTH = 8;

  
 % check size of inputs. 
 DY = size(stimulation, 2);
 CY = size(coef_matrix_in, 2);
 if CY ~= DY * INTER_FACTOR
    fprintf('WARNING : coef_matrix size and input data size does not match\n');
 end 

 %fill coef_matrix to length of data with the latest coef set 
 if CY < DY * INTER_FACTOR
     coef_matrix = coef_matrix_in(bank + 1, :);
   end 
	  
 % check if input is integer 
       	int_sti=round(stimulation); 
	    T = (int_sti ~= stimulation); 
	    if (max(T)~=0) 
	        fprintf('WARNING : Integer Input Expected: Rounding Fractional Input to Nearest Integer...\n'); 
	    end 
	     
	    %Input overflow check 
        %set max/min for signed 
        maxdat = 2^(DATA_WIDTH-1)-1; 
        mindat = -maxdat-1; 

	    %Saturating Input Value 
	    a=find(int_sti>maxdat); 
	    b=find(int_sti<mindat); 
	    if (~isempty(a)|~isempty(b)) 
	 	    fprintf('WARNING : Input Amplitude Exceeds MAXIMUM/MINIMUM allowable values - saturating input values...\n'); 
	            lena = length (a); 
	            lenb = length (b); 
	            for i =1:lena 
	        	    fprintf('%d > %d \n', int_sti(a(i)), maxdat); 
			        int_sti(a(i)) = maxdat; 
		        end 
		    for i =1:lenb 
			    fprintf('%d < %d \n', int_sti(b(i)), mindat); 
			    int_sti(b(i)) = mindat; 
		    end 
	    end 
         
	    % Add interpolation 
   	    inter_sti = zeros(1, INTER_FACTOR * length(int_sti)); 
	    inter_sti(1:INTER_FACTOR:INTER_FACTOR * length(int_sti)) = int_sti; 
 
         
        for i = 1 : DY *INTER_FACTOR 
    	    coef_current = coef_matrix(i,:); 
            output_temp(i) = simp_adaptive (inter_sti, coef_current, i); 
        end 

	% Truncate output 
	len1 = length(output_temp); 
	 
	    switch  LSB_TYPE 
	    case 0 
	        %truncate 
            out_dec = bi_trunc_lsb(output_temp,LSB_RM,FIR_WIDTH); 
	    case 1 
	        %round 
            out_dec = bi_round(output_temp,LSB_RM, FIR_WIDTH); 
	    end 
         
 	    switch  MSB_TYPE 
	    case 0 
	        %truncate 
            out_dec = bi_trunc_msb(out_dec,MSB_RM,FIR_WIDTH-LSB_RM); 
	    case 1 
	        %round 
            out_dec = bi_satu(out_dec,MSB_RM, FIR_WIDTH-LSB_RM); 
	    end 
 	    
    	% choose decimation output in phase=DECI_FACTOR-1  
     	if(DECI_FACTOR == 1) 
     		output = out_dec; 
else
    output = out_dec(1:DECI_FACTOR:len1);
end

function[output, outindex] = simp_adaptive (int_sti, coef_current, data_index)

	%Simulation is the whole input sequence 
	%coef_current is the current coefficient set 
	%data_index gives the last data to use 
    % output is the sum of input and coef multiplication
	%outindex is the next data_index 
    
    coef_length = length(coef_current);
	data_length = length(int_sti); 
	 
	if (data_index > data_length) 
		fprintf('ERROR: DATA INDEX IS LARGER THAN DATA LENGTH!!!\n'); 
        return
	end 
    min_index = max(data_index - data_length, 1);
    max_index = min(data_index, coef_length);
	 
	outindex= data_index+1; 
    output = int_sti(data_index + 1 - (min_index:max_index)) * coef_current(min_index:max_index).';
 
function output = bi_round(data_in,LSB_RM,ORI_WIDTH)
	% LSB_RM is the bit to lose in LSB 
	% ORI_WIDTH is the original data width

	data = round (data_in / 2^LSB_RM);

	output = bi_satu(data,0,ORI_WIDTH - LSB_RM); 
	 
function output = bi_trunc_lsb(data_in,LSB_RM,ORI_WIDTH)
	% LSB_RM is the bit to lose in LSB 
	% ORI_WIDTH is the original data width 
	%2's complement system 
	output = bitshift((2^ORI_WIDTH*(data_in<0)) + (2^LSB_RM)*floor(data_in/(2^LSB_RM)), -LSB_RM) - (2^(ORI_WIDTH-LSB_RM)) *(data_in<0); 
	 
function output = bi_trunc_msb(data_in,MSB_RM,ORI_WIDTH)
	% MSB_RM is the bit to lose in LSB 
	% ORI_WIDTH is the original data width 
	%2's complement system 
	data = 2^ORI_WIDTH * (data_in < 0)+ data_in; 
	erase_num = 2^(ORI_WIDTH - MSB_RM) - 1; 
	data = bitand(data, erase_num); 
	output = data - 2^(ORI_WIDTH - MSB_RM)*(bitget(data,ORI_WIDTH - MSB_RM)); 
	 
function output = bi_satu(data_in,MSB_RM,ORI_WIDTH)
	% MSB_RM is the bit to lose in LSB 
	% ORI_WIDTH is the original data width 
	%2's complement system 
	maxdat = 2^(ORI_WIDTH - MSB_RM - 1)-1; 
	mindat = 2^(ORI_WIDTH - MSB_RM - 1)*(-1); 
    data_in(data_in > maxdat) = maxdat;
    data_in(data_in < mindat) = mindat;
	output = data_in; 

