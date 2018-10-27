library ieee ; 
use ieee.std_Logic_1164.all ; 
entity parity_detector is 
	port( rst , x,clk : in std_logic ; 
	output : out string ( 9 downto 1 )  ) ; 
end entity ; 
architecture behav of parity_detector is 
	type states is (even , odd ) ;
	signal pr_state,nx_state : states ; 
begin
process(clk,rst) is begin
	if ( rst = '1' ) then 
		pr_state<=even ; 
	elsif rising_edge(clk) then
		pr_state<= nx_state ;
	end if ;
end process ; 
----------------COMBINATIONAL 
process ( x , pr_state)  is begin
	case pr_state is 
		when odd =>
			if(x ='1' ) then 
				nx_state<=even ; 
				output <="I am even " ; 
			else 
				nx_state<= odd ; 
				output <= " I am odd "  ;
			end if ; 
		when even => 
			if(x = '1' ) then 
				nx_state<=odd ; 
				output<="I am odd " ; 
			else 
				nx_state<=even ;
				output<="I'm even" ; 
			end if ; 
	end case; 
end process ; 
end behav; 
