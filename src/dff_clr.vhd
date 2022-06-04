LIBRARY ieee;
USE std_logic_1164.ALL;

ENTITY dff_clr IS
	PORT (
		SIGNAL Aclr, Sclr : IN BIT;
		SIGNAL d, clk : IN STD_LOGIC;
		SIGNAL q : OUT STD_LOGIC);
END dff_clr;

ARCHITECTURE behavior OF dff_clr IS
BEGIN
	PROCESS (clk, Aclr, Sclr)
	BEGIN
		-- This is how to impleent asynchronous
		-- control signals for the register.
		-- Therefore, Aclr = '1' does not depend
		-- on the clock
		IF (Aclr = '0') THEN
			q <= '0';
		ELSIF rising_edge(clk) THEN
			-- Synchronous reset Sclr is inside the If-Then
			-- statement that checks the condtion rising_edge
			-- Therefore Sclr = '1' depends on the clock
			IF (Sclr = '0') THEN
				q <= '0';
			ELSE
				q <= d;
			END IF;
		END IF;
	END PROCESS;
END behavior;