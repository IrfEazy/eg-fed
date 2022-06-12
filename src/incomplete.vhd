LIBRARY ieee;
USE std_logic_1164.ALL;

ENTITY incomplete IS
    PORT (
        SIGNAL a, b : IN STD_LOGIC;
        SIGNAL c : OUT STD_LOGIC);
END incomplete;

ARCHITECTURE archincomplete OF incomplete IS
BEGIN
    PROCESS (a, b)
    BEGIN
        IF (a = '1') THEN
            c <= b;
        END IF;
    END PROCESS;
END archincomplete;

-- Here, the incomplete specification of the
-- If-Then statement causes a latch to be
-- synthesized to store the previous state of 'c'
-- To avoid the generation of unexpected
-- latches:
--   - always terminate an If-Then-Else statament with an else
--     clause;
--   - cover all alternatives in a Case statement:
--       - define every alternative individually, or
--       - terminate the Case statement with a When others clause.