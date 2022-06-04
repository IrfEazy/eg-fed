LIBRARY ieee;
USE std_logic_1164.ALL;
USE std_logic_unsigned.ALL;

ENTITY count_a IS
	PORT (
		SIGNAL clk, rst, updn : IN STD_LOGIC;
		SIGNAL q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END count_a;

ARCHITECTURE logic OF count_a IS
BEGIN
	PROCESS (rst clk)
		VARIABLE tmp_q : STD_LOGIC_VECTOR(15 TO 0);
	BEGIN IF (rst = '0') THEN
		-- Asynchronous reset
		tmp_q := (OTHERS => '0');
	ELSIF rising_edge(clk) THEN
		-- Arithmetic expression assigned to a
		-- variable
		IF (updn = '1') THEN
			tmp_q := tmp_q + 1;
		ELSE
			tmp_q := tmp_q - 1;
		END IF;
	END IF;
	-- Variable assigned to a signal
	-- note: presence of tmp_q allows q to
	-- be an output
	q <= tmp_q;
END PROCESS;
END logic;