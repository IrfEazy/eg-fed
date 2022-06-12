LIBRARY ieee;
USE std_logic_1164.ALL;
USE std_logic_unsigned.ALL;

-- Q is a buffer because is an out
-- that is read
ENTITY count_a IS
    PORT (
        SIGNAL clk, rst, updn : IN STD_LOGIC;
        SIGNAL q : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0));
END count_a;

ARCHITECTURE logic OF count_a IS
BEGIN
    -- Always filter external signals
    -- sampled by clk (as updn)
    -- rst must be in the sensitivity list
    PROCESS (rst, clk)
        SIGNAL tmp_updn : STD_LOGIC;
    BEGIN
        IF (rst = '0') THEN
            q := x"00";
        ELSIF rising_edge(clk) THEN
            -- NOTE about metastability:
            --   - rst is asynchronous and does not
            --     suffer of metastability
            --   - Updn is synchronous and there
            --     is a filter thanks to tmp_updn
            -- Filter for metastability (tmp_updn could
            -- suffer from metastability, but metastable
            -- condition decays with a clk cycle, so at the
            -- next rising_edge the value is stable).
            -- NOTE: q is a signal and it must be
            -- declared as a buffer (if declared as out it
            -- cannot be interrogated in input)
            tmp_updn <= updn;

            IF (tmp_updn = '1') THEN
                q <= q + 1;
            ELSE
                q <= q - 1;
            END IF;
        END IF;
    END PROCESS;
END logic;