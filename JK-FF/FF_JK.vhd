library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

Entity FF_JK is
    port(
        CLK, CLR, PR, J, K: in STD_LOGIC;
        S: out STD_LOGIC
    );
end FF_JK;

Architecture FF_JK_arch of FF_JK is 

end 