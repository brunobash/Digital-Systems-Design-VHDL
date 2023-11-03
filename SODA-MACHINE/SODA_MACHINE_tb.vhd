library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

Entity SodaMachine_tb is 
end SodaMachine_tb;

Architecture SodaMachine_tb_arch of SodaMachine_tb is
    component SodaMachine port(
        A: in STD_LOGIC_VECTOR(1 downto 0);
        CLK, RESET: in STD_LOGIC;
        R: out STD_LOGIC
    );
    end component;

    constant G: time := 2 ns;

    signal A: std_logic_vector(1 downto 0);
    signal CLK, RESET: std_logic;
    signal R, S, T: std_logic;

    begin
        soda: SodaMachine port map(
            A => A, 
            RESET => RESET,
            CLK => CLK,
            R => R
        );

        clock: process
        begin
            CLK <= '0', '1' after G/2, '0' after G;
            wait for G;

        end process clock;

        proc: process
        begin 
        A <= "00";
        for i in 1 to 10 loop
            wait for 6 ns;
            A <= unsigned(A) + 1;
        end loop;

        wait for 1 ns;

        RESET <= '1';
        wait for 3 ns;

        RESET <= '0';

        A <= "01";
        for i in 1 to 10 loop
            wait for 6 ns;
            A <= unsigned(A) + 1;
        end loop;

        wait for 1 ns;

        RESET <= '1';
        wait for 3 ns;

        RESET <= '0';

        A <= "10";
        for i in 1 to 10 loop
            wait for 7 ns;
            A <= unsigned(A) + 1;
        end loop;

        wait for 1 ns;
        RESET <= '1';
        wait for 3 ns;
        RESET <= '0';

        A <= "11";
        for i in 1 to 10 loop
            wait for 6 ns;
            A <= unsigned(A) + 1;
        end loop;

        wait for 1 ns;
        RESET <= '1';
        wait for 3 ns;
        RESET <= '0';

        A <= "11";
        for i in 1 to 3 loop
            wait for 6 ns;
            A <= unsigned(A) + 10;
        end loop;

        A <= "00";

        for i in 1 to 3 loop
            wait for 6 ns;
            A <= unsigned(A) + 1;
        end loop;

        wait fo 1 ns;

        A <= "11";
        wait for 6 ns;
        A <= "00";

        wait for 1 ns;
        RESET <= '1';
        wait for 3 ns;
        RESET <= '0';
        wait;
    end process;
end SodaMachine_tb_arch; 