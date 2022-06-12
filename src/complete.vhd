LIBRARY ieee;
USE std_logic_1164.ALL;

ENTITY complete IS
    PORT (
        SIGNAL a, b : IN STD_LOGIC;
        SIGNAL c : OUT STD_LOGIC);
END complete;

ARCHITECTURE archcomplete OF complete IS
BEGIN
    PROCESS (a, b)
    BEGIN
        IF (a = '1') THEN
            c <= b;
        ELSE
            c <= '0';
        END IF;
    END PROCESS;
END archcomplete;
-- The conditional statement is fully specified,
-- and this causes the process to synthesize