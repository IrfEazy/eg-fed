LIBRARY ieee;
USE std_logic_1164.ALL;

ENTITY var IS
    PORT (
        SIGNAL a, b : IN STD_LOGIC;
        SIGNAL y : OUT STD_LOGIC);
END var;

ARCHITECTURE logic OF var IS
BEGIN
    PROCESS (a, b)
        VARIABLE c : STD_LOGIC;
        SIGNAL d : STD_LOGIC;
    BEGIN
        -- c and d gets executed and updated within the
        -- same simulation cycle (at the end of the
        -- process) y has a cycle of delay
        c := a AND b;
        d <= c;
        y <= d;
    END PROCESS;
END logic;