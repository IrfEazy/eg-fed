LIBRARY ieee;
USE std_logic_1164.ALL;

ENTITY cmb_var IS
    PORT (
        SIGNAL i0, i1, a : IN BIT;
        SIGNAL q : OUT BIT);
END cmb_var;

ARCHITECTURE logic OF cmb_var IS
BEGIN
    PROCESS (i0, i1, a)
        VARIABLE val : INTEGER RANGE 0 TO 1;
    BEGIN
        val := 0;
        IF (a = '0') THEN
            val := val; -- val is a variable that is updated at the
            -- instant an assignment is made to it
        ELSE
            val := val + 1;
        END IF;
        CASE val IS
                -- therefore, the updated value of val is
                -- available for the case statement
            WHEN 0 => q <= i0;
            WHEN 1 => q <= i1;
        END CASE;
    END PROCESS;
    ----------------------------------------------------------------
    -- The two way of assignment are equivalent
    PROCESS (sela, selb, a, b, c)
    BEGIN
        IF (sela = '1') THEN
            q <= a;
        ELSIF selb = '1' THEN
            q <= a;
        ELSE
            q <= c;
        END IF;
    END PROCESS;
    q <= a WHEN sela = '1' ELSE
        b WHEN selb = '1' ELSE
        c;
    -- If we a sel signal which select a signal between a, b, c and d we got:
    PROCESS (sel, a, b, c, d)
        CASE sel IS
            WHEN "00" => q <= a;
            WHEN "01" => q <= b;
            WHEN "10" => q <= c;
            WHEN OTHERS => q <= d; -- Optional
        END CASE;
    END PROCESS;
    WITH sel SELECT
        q <= a WHEN "00", b WHEN "01", c WHEN "10", d WHEN OTHERS;
    ----------------------------------------------------------------
END logic;