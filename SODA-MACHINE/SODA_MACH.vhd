library IEEE;
use IEEE.STD_LOGIC_1164;

Entity SodaMachine is 
	port(
		A: in STD_LOGIC_VECTOR(1 downto 0);
		CLK, RESET: in STD_LOGIC;
		R: out STD_LOGIC;
		ch25: out STD_LOGIC;
		ch50: out STD_LOGIC;
	    );
end SodaMachine
