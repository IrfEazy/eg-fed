LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY counter_with_modulus_10 IS
    PORT (
        areset, clock, load_enable, enable_signal : IN STD_LOGIC;
        load_data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        counter_output : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0));
END ENTITY counter_with_modulus_10;

ARCHITECTURE architecture_counter_with_modulus_10 OF counter_with_modulus_10 IS
    SIGNAL load : STD_LOGIC;
    SIGNAL enable : STD_LOGIC;
    SIGNAL loaddata : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    PROCESS (areset, ck)
    BEGIN
        IF areset = '0' THEN
            counter_output <= "0000";
        ELSIF rising_edge(ck) THEN
            load <= load_enable; -- filtro anti-metastabilita
            loaddata <= load_data; -- filtro anti-metastabilita
            enable <= enable_signal; -- filtro anti-metastabilita

            IF load = '1' THEN
                IF loaddata <= X"9" THEN
                    counter_output <= loaddata;
                ELSE
                    counter_output <= X"0";
                END IF;
            ELSIF enable = '1' THEN
                IF counter_output = X"0" THEN
                    counter_output <= X"9";
                ELSE
                    counter_output <= counter_output - 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE architecture_counter_with_modulus_10;