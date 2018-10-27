library ieee ; 
use ieee.std_logic_1164.all ; 
entity FSM is 
	port(clk,rst : in std_logic ; 
	x : in std_logic ;
	status: out string ( 3 downto 1 )) ; 
end entity ; 
architecture behav of FSM is 
	type states is (stop,steady,go ) ;
	signal pr_state,nx_state : states ; 
begin
process (clk,rst) is begin
	if ( rst = '1' ) then 	
		pr_state<= stop ; 
	elsif (rising_Edge(clk)) then  
		pr_state<=nx_state ; 
	end if ; 
end process ;
-------COMBINATIONAL PROCESS 
process(pr_state,x  ) is begin
	case pr_state is 
		when stop => 
			status <= "red" ; 
			if ( x= '1' ) then 
				nx_state<=steady ; 
			else
				nx_state<=stop ;
			end if ;
		when steady => 
			status<="yel"; 
			if (x ='1' ) then 
				nx_state<= go ; 
			else
				nx_state<=steady ; 
			end if ; 
		when go => 
			status <= "grn";
			if (x ='1' ) then	
				nx_state <= stop ; 
			else 
				nx_state<= go ; 
			end if; 
	end case ; 
end process ; 
end  behav ;

