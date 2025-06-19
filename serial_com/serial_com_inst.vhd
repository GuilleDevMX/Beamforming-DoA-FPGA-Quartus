	component serial_com is
		port (
			clk_clk          : in  std_logic := 'X'; -- clk
			reset_reset_n    : in  std_logic := 'X'; -- reset_n
			rs232_0_UART_RXD : in  std_logic := 'X'; -- RXD
			rs232_0_UART_TXD : out std_logic         -- TXD
		);
	end component serial_com;

	u0 : component serial_com
		port map (
			clk_clk          => CONNECTED_TO_clk_clk,          --                        clk.clk
			reset_reset_n    => CONNECTED_TO_reset_reset_n,    --                      reset.reset_n
			rs232_0_UART_RXD => CONNECTED_TO_rs232_0_UART_RXD, -- rs232_0_external_interface.RXD
			rs232_0_UART_TXD => CONNECTED_TO_rs232_0_UART_TXD  --                           .TXD
		);

