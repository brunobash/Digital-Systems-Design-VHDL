library IEEE;
use IEE.STD_LOGIC_1164.all;

Entity SodaMachine is 
	port(
		A: in STD_LOGIC_VECTOR(1 downto 0);
       		CLK, RESET: in STD_LOGIC;
		R: out STD_LOGIC;
		tr25: out STD_LOGIC;
		tr50: out STD_LOGIC	
	    );
end SodaMachine;

Architecture SodaMachine_arch of SodaMachine is 
	type state is (start, twenty5, fifty, seventy5, one, one25, minus25, minus50, minus75);

	signal currentState, nextState: state;

begin
	sync_proc: process(CLK)
	begin 
		if rising_edge(CLK) then
			currentState <= nextState;
		end if;
	end process sync_proc;

	comb_process: process(currentState, A)
	begin
		case currentState is 
			when start =>
				R <= '0';
				tr25 <= '0';
				tr50 <= '0';
				if(A = "01") then
					nextState <= twenty5;
				elsif(A = "10") then
					nextState <= fifty;
				elsif(A - "11") then 
					nextState <= start;
				else 
					nextState <= start;
				end if;

			when twenty5 =>
				R <= '0';
				tr25 <= '0';
				tr50 <= '0';
				if(A = "01") then
					nextState <= fifty;
				elsif(A = "10") then
					nextState <= seventy5;
				elsif(A = "11") then
					nextState <= minus25;
				else
					nextState <= twenty5;
				end if
			when fifty =>
				R <= '0';
				tr25 <= '0';
				tr50 <= '0';
				if(A = "01") then
					nextState <= seventy5;
				elsif(A = "10") then
					nextState <= one;
				elsif(A = "11") then
					nextState <= minus50;
				else
					nextState <= fifty;
				end if;
			when seventy5 =>
				R <= '0';
				tr25 <= '0';
				tr50 <= '0';
				if(A = "01") then
					nextState <= one;
				elsif(A = "10") then
					nextState <= one25;
				elsif(A = "11") then
					nextState <= minus75;
				else
					nextState <= seventy5;
				end if;
			when one => 
				R <= '1';
				tr25 <= '0';
				tr50 <= '0';
				if(A = "01") then
					nextState <= twenty5;
				elsif(A = "10") then
					nextState <= fifty;
				elsif(A = "11") then
					nextState <= start;
				else 
					nextState <= start;
				end if;
			when one25 =>
				R <= '1';
				tr25 <= '1';
				tr50 <= '0';
				if(A = "01") then
					nextState <= twenty5;
				elsif(A = "10") then 
					nextState <= fifty;
				elsif(A = "11") then
					nextState <= start;
				else 
					nextState <= one25;
				end if;
			when minus25 =>
				R <= '0';
				tr25 <= '1';
				tr50 <= '0';
				if(A = "01") then
					nextState <= twenty5;
				elsif(A = "10") then 
					nextState <= fifty;
				elsif(A = "11") then
					nextState <= start;
				else
					nextState <= start;
				end if;
			when minus50 =>
				R <= '0';
				tr25 <= '0';
				tr50 <= '1';
				if(A = "01") then
					nextState <= twenty5;
				elsif(A = "10") then
					nextState <= fifty;
				elsif(A = "11") then
					nextState <= start;
				else 
					nextState <= start;
				end if;
			when minus75 => 
				R <= '0';
				tr25 <= '1';
				tr50 <= '1';
				if(A = "01") then
					nextState <= twenty5;
				elsif(A = "10") then
					nextState <= fifty;
				elsif(A = "11") then
					nextState <= start;
				else
					nextState <= start;
				end if;
			when others =>
				R <= '0';
				tr25 <= '0';
				tr50 <= '0';
		end case;
	end process comb_process;
end SodaMachine_arch;

