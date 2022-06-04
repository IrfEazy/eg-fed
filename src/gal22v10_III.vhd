LIBRARY ieee;
USE std_logic_1164.ALL;
USE std_logic_unsigned.ALL;

ENTITY gal22v10_III IS
	PORT (
		Clk, Areset, En : IN STD_LOGIC;
		B, A : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		Outx : OUT STD_LOGIC;
		S : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		C : BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0));
END ENTITY gal22v10_III;

ARCHITECTURE adder_counter OF gal22v10_III IS
	enable : STD_LOGIC;
BEGIN
	PROCESS (Areset, Clk)
	BEGIN
		IF Areset = '0' THEN
			C <= "000";
		ELSIF rising_edge(Clk) THEN
			enable <= En;
			IF enable = '1' THEN
				IF C = "111" THEN
					C <= "000"
						ELSE
						C <= C + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;
	Outx <= '1' WHEN C = "000" ELSE
		'0';
	S <= A + B;
END ARCHITECTURE adder_counter;