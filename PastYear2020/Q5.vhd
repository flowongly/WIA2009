library IEEE;
use IEEE.std_logic_1164.all;

-- declare entity
entity concurrent is
    port (
        a : in std_logic;
        b : in std_logic;
        c : in std_logic;
        x : out std_logic
    );
end concurrent;

architecture Behavioral of concurrent is
    signal z : std_logic_vector(2 downto 0);
begin
    process (a, b, c)
    begin
        z <= a & b & c; 
        x <= '1' when z = "000" or z = "001" or z = "011" or z = "111" else
             '0' when z = "010" or z = "100" else
             '-' when z = "101" or z = "110" else
             'Z' ;
    end process;
end Behavioral;
