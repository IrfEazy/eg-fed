LIBRARY ieee;
USE std_logic_1164.ALL;
USE std_logic_unsigned.ALL;

ENTITY reg1 IS
	PORT (
		SIGNAL d, clk : IN STD_LOGIC;
		SIGNAL q : OUT STD_LOGIC);
END reg1;

-- How many registers? 2
ARCHITECTURE reg1 OF reg1 IS
	SIGNAL a, b : STD_LOGIC;
BEGIN
	PROCESS (clk)
	BEGIN
		IF (rising_edge(clk)) THEN
			a <= d;
			b <= a;
		END IF;
	END PROCESS;
	q <= b;
END reg1;
-- B to Q assignment is no longer edge-sensitive
-- because it is not inside the If-Then
-- statement that checks the clock condition

-- How many registers? 1
ARCHITECTURE reg1 OF reg1 IS
BEGIN
	PROCESS (clk)
		VARIABLE a, b : STD_LOGIC;
	BEGIN
		IF (rising_edge(clk)) THEN
			a <= d;
			b <= a;
			q <= b;
		END IF;
	END PROCESS;
END reg1;
-- Variable assignments are updated
-- immediately (variable assignments are
-- temporary storage and have o hardware intent)
-- Signal assignments are updated on clock edge