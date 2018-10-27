library ieee ;
use ieee.std_logic_1164.all ; 
entity sequence_tb is 
	end entity ; 
architecture behav of sequence_tb is 
	component sequence_detector is 
		port(x,clk,rst : in std_logic ; 
		indicator : out std_logic_vector( 3 downto 0 ) ) ;
	end component ;
	------------
	signal x, clk ,rst : std_logic ; 
	signal indicator : std_logic_vector ( 3 downto 0 ) ; 
begin 
	dut: sequence_detector port map (x , clk ,rst , indicator ) ; 
proc1: process is begin
	clk<='0' ; 
	wait for 10 ns ; 
	clk <='1' ; 
	wait for 10 ns ; 
end process ; 
-------------
proc2: process is begin
rst <= '1' ; 
wait for 20 ns ; 
assert indicator = "0---" report "error resetting" severity warning ; 
rst<='0' ; 
x<='1'; 
wait for 20 ns ; 
assert indicator = "00--" report "error state 1 " severity warning ; 
x<='0'  ; 
wait for 20 ns ; 
assert indicator = "00--" report "error in low transmission" severity warning ; 
x<='1' ; 
wait for 20 ns ; 
assert indicator = "001-" report "error state 2 " severity warning ; 
x<='1' ;
wait for 20 ns ; 
assert indicator = "0010" report "error matching sequence" severity warning ; 
wait for 20 ns ; 
assert false report " end of simulation " severity failure ; 
end process ; 
end behav ; 
