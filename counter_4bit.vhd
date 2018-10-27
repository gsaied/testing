library ieee ; 
use ieee.std_logic_1164.all ; 
use ieee.std_logic_unsigned.all ; 
entity counter_4bit is 
	port(rst , clk : in std_logic ; 
	count : out std_logic_vector ( 3 downto 0 )) ;
end entity ; 
architecture behav of counter_4bit is 
	signal tmp :  std_logic_vector ( 3 downto 0 ) ; 
begin
process(clk,rst) is begin
	if ( rst ='1') then 
		tmp<=(others => '0' ) ;
	elsif (clk'event and clk ='1') then 
		tmp <= tmp +1 ; 
	end if ; 
end process;
end behav ; 
