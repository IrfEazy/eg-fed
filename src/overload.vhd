LIBRARY ieee;
USE std_logic_1164.ALL;
USE std_logic_unsigned.ALL;

ENTITY overload IS
    PORT (
        -- r, t, g, h and qb are signals
        SIGNAL r, t, g, h : IN STD_LOGIC;
        SIGNAL a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        SIGNAL b : IN STD_LOGIC_VECTOR(4 TO 0);
        SIGNAL temp : IN STD_LOGIC_VECTOR(7 TO 0);
        SIGNAL qb : OUT STD_LOGIC;
        SIGNAL sum : OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
END overload;

ARCHITECTURE example OF overload IS
    -- qa is a buried signal and needs to be declared
    SIGNAL qa : IN STD_LOGIC;
BEGIN
    -- Signal assignments are represented by <=
    -- Signal assignments have an Implied process
    -- function that synthesizes to hardware
    temp <= "10101010";
    temp <= X"aa";
    temp(7) <= '1';
    temp (7 DOWNTO 4) <= "1010";
    qa <= r OR t;
    qb <= (qa AND NOT (g XOR h));
END example;