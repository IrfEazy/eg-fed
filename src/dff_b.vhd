LIBRARY ieee;
USE std_logic_1164.ALL;

ENTITY diff_b IS
    PORT (
        SIGNAL d, clk : IN STD_LOGIC;
        SIGNAL q : OUT STD_LOGIC);
END diff_b;

ARCHITECTURE behavior OF diff_b IS
BEGIN
    PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            q <= d;
        END IF;
    END PROCESS;
END behavior;

-- rising_edge (best to be preferred):
--   - IEEE function that is defined in the
--     std_logic_1164 package
--   - specifies that the signal value
--     must be 0 to 1
--   - X, Z to 1 transition is not allowed
--     (as it may occur in clk'event
--     and clk = '1')