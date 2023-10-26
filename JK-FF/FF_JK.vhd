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
begin
    P1: process (CLK, CLR, PR)
    variable qbuf: std_logic;
    
    begin 
        if(PR = '1') then
            qbuf := '1';
        elsif(CLR = '1') then 
            qbuf := '0';
        elsif(CLK = '1' AND CLK'EVENT) then
            if(J = '0' and K = '0') then
                qbuf := qbuf;
            elsif(J = '1' AND K = '1') then
                qbuf := NOT qbuf;
            elsif(J = '0' AND K = '1') then
                qbuf := '0';
            else
                qbuf := '1';
            end if;
        end if;
        
        S <= qbuf;
    end process;
end FF_JK_arch;