library ieee ; 
use ieee.std_logic_1164.all ; 
use ieee.all;
entity sequence_detector is 
	port ( x,clk,rst : in std_logic ;
	indicator : out std_logic_vector (3 downto 0 )) ; 
end entity ; 
architecture behav of sequence_detector is 
	type states is (s0,s1,s2,s3) ; 
	signal pr_state,nx_state : states ; 
begin
process ( clk, rst ) is begin
	if ( rst = '1' ) then 
		pr_state <= s0 ; 
	elsif (rising_edge(clk)) then 
		pr_state<= nx_state ; 
	end if ; 
end process ; 
------------------COMBINATIONAL 
process ( pr_state , x ) is begin
	case pr_state is
		when s0 => --0
			indicator <= "0---" ;
			if(x = '1' ) then 
				nx_state<= s0 ; 
			elsif ( x = '0' ) then
				nx_state<= s1 ; 
			end if ; 
		when s1 => --00
			indicator <= "00--" ; 
			if(x = '1' ) then 
				nx_state<= s2 ; 
			elsif ( x = '0' ) then
				nx_state<= s1 ; 
			end if ; 
		when s2 => --001
			indicator <= "001-" ; 
			if(x = '1' ) then 
				nx_state<= s3 ; 
			elsif ( x = '0' ) then
				nx_state<= s1 ; 
			end if ; 
		when s3 => --0010
			indicator <= "0010";
			if ( x = '1' ) then
				nx_state<= s0 ; 
			end if ; 
	end case ; 
end process ; 
end behav ; 
