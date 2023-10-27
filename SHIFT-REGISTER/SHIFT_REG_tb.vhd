library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SHIFT_REG_tb is
end SHIFT_REG_tb;

Architecture SHIFT_REG_tb_arch of SHIFT_REG_tb is
    component SHIFT_REG port(
        CLK, RST, LOAD, DIR, L, R: in STD_LOGIC;
        D: in STD_LOGIC_VECTOR(3 downto 0);
        Q: out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;

    signal CLK_tb, RST_tb, LOAD_tb, DIR_tb, L_tb, R_tb: STD_LOGIC;
    signal D_tb, Q_tb: STD_LOGIC_VECTOR(3 downto 0);

    begin
        DUT: SHIFT-REG
        port map(
            CLK => CLK_tb,
            RST => RST_tb, 
            LOAD => LOAD_tb, 
            DIR => DIR_tb, 
            L => L_tb, 
            R => R_tb,
            D => D_tb,
            Q => Q_tb
        );
        
        CLK_process: process
        begin
            CLK_tb <= '0';
            wait for 5 ns;

            CLK_tb <= '1';
        end process;

        stimulus: process
        begin

            RST_tb <= '0';
            LOAD_tb <= '0';
            DIR_tb <= '0';
            L_tb <= '0';
            R_tb <= '0';
            D_tb <= '0'; 
            wait for 10 ns;

            RST_tb <= '1';
            wait for 10 ns;

            RST_tb <= '0';
            LOAD_tb <= '1';
            D_tb <= D_tb;
            wait for 10 ns;

            RST_tb <= '0';
            LOAD_tb <= '0';
            DIR_tb <= '0';
            L_tb <= '0';
            wait for 10 ns;

            RST_tb <= '0';
            LOAD_tb <= '0';
            DIR_tb <= '0';
            L_tb <= '1';
            wait for 10 ns;

            RST_tb <= '0';
            LOAD_tb <= '0';
            DIR_tb <= '1';
            L_tb <= '0';
            wait for 10 ns;
            
            RST_tb <= '0';
            LOAD_tb <= '0';
            DIR_tb <= '1';
            R_tb <= '0';
            wait for 10 ns;

            RST_tb <= '0';
            LOAD_tb <= '0';
            DIR_tb <= '1';
            R_tb <= '0';
            wait for 10 ns;

            RST_tb <= '0';
            LOAD_tb <= '0';
            DIR_tb <= '1';
            R_tb <= '1';
            wait for 40 ns;

            RST_tb <= '1';
            wait for 10 ns;
            wait;
        end process;
end SHIFT_REG_tb_arch;