LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ent IS
    PORT (
        in1, in2 : IN STD_LOGIC;
        out1 : OUT STD_LOGIC);
END ENTITY ent;

ARCHITECTURE entity_architecture OF ent IS
    SIGNAL tmp : STD_LOGIC;
BEGIN
    and_gate : PROCESS (in1, in2)
    BEGIN
        tmp <= in1 AND in2;
        out1 <= in1 AND in2;
    END PROCESS;
END ARCHITECTURE entity_architecture;