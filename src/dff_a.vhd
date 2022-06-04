LIBRARY ieee;
USE std_logic_1164.ALL;

ENTITY dff_a IS
	PORT (
		SIGNAL d, clk : IN STD_LOGIC;
		SIGNAL q : OUT STD_LOGIC);
END dff_a;

ARCHITECTURE behavior OF dff_a IS
BEGIN
	PROCESS (clk)
	BEGIN
		IF (clk'event AND clk = '1') THEN
			q <= d;
		END IF;
	END PROCESS;
END behavior;

-- clk'event and clk = '1'
--  - clk is the signal name (any name)
--  - 'event is a VHDL attribute,
--        specifying that there need
--        to be a change in signal value
--  - clk = '1' means positive-edge triggered