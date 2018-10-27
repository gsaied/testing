library ieee ;
use ieee.std_logic_1164.all ; 
use ieee.numeric_std.all ; 
entity traffic_tb is 
	end entity ; 
architecture behav of traffic_tb is 
	component FSM is 
		port(clk ,rst : in std_logic ; 
		x : in std_logic ; 
		status : out string ( 3 downto 1 )  ) ;
	end component ; 
	-----------
	signal clk,rst,x : std_logic ; 
	signal status : string (3 downto 1 ) ; 
begin
-------
dut: FSM port map (clk,rst,x,status ) ; 
CLK_proc: process is begin
clk<='0' ; 
wait for 10 ns ; 
clk <= '1' ; 
wait for 10 ns ;
end process ; 
--------
proc2: process is begin
	rst <= '1'; 
	wait for  20 ns  ;
	assert status ="red"  report  "error resetting " severity warning ; 
	rst <= '0' ; 
	wait for  20 ns ; 
	x <= '1' ; 
	wait for  20 ns ;
	assert status = "yel" report "error steady" severity warning  ; 
	wait for  20 ns ;
	assert status = "grn" report "error going" severity warning  ; 
	assert false report " end of simulation" severity failure ; 
end process ; 
end behav;
