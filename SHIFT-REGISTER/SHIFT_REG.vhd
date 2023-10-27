library IEEE;
use IEEE.STD_LOGIC_1164.all;

Entity SHIFT_REG is
    port(
        CLK, RST, LOAD, DIR, L, R: in STD_LOGIC;
        D: in STD_LOGIC_VECTOR(3 downto 0);
        Q: out STD_LOGIC_VECTOR(3 downto 0)
    );
end SHIFT_REG;

Architecture SHIFT_REG_arch of SHIFT_REG is
    signal qbuf: STD_LOGIC_VECTOR(3 downto 0);

    begin
        process(CLK, RST)
        begin
            if RISING_EDGE(CLK)

end SHIFT_REG_arch;