library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity FF_JK_tb is
end FF_JK_tb;

Architecture FF_JK_tb_arch of FF_JK_tb is 
    component FF_JK
        port(
            CLK, PR, CLR, J, K: in STD_LOGIC;
            S: out STD_LOGIC
        );
    end component;

    signal CLK_tb, PR_tb, CLR_tb, J_tb, K_tb, S_tb: STD_LOGIC;

    begin
        DUT: FF_JK
            port map(
                CLK => CLK_tb,
                PR => PR_tb,
                CLR => CLR_tb,
                J => J_tb,
                K => K_tb,
                S => S_tb
            );
    
    CLK_process: process
    begin
        CLK_tb <= '0';
        wait for 5 ns;
        CLK_tb <= '1';
        wait for 5 ns;
    end process;

    stimulus: process
    begin
        CLR_tb <= '0';
        PR_tb <= '1';
        J_tb <= '0';
        K_tb <= '0';
        wait for 10 ns;

        CLR_tb <= '1';
        PR_tb <= '0';
        J_tb <= '0';
        K_tb <= '0';
        wait for 10 ns;

        CLR_tb <= '0';
        PR_tb <= '0';
        J_tb <= '0';
        K_tb <= '0';
        wait for 10 ns;

        CLR_tb <= '0';
        PR_tb <= '0';
        J_tb <= '0';
        K_tb <= '1';
        wait for 10 ns;

        CLR_tb <= '0';
        PR_tb <= '0';
        J_tb <= '1';
        K_tb <= '0';
        wait for 10 ns;

        CLR_tb <= '0';
        PR_tb <= '0';
        J_tb <= '1';
        K_tb <= '1';
        wait for 10 ns; 

        wait;
    end process;
end FF_JK_tb_arch;