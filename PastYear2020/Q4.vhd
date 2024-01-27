library IEEE;
use IEEE.std_logic_1164.all;

--A two-to-one multiplexer has two data inputs, a and b, and one select input s. The multiplexer has a single output c. If s = 0, c is equal to a. If s = 1, c is equal to b.

-- declare entity
entity 2to1Mux is
port(
 a : in std_logic;
 b : in std_logic;
 s : in std_logic; -- select
 c : out std_logic;
);
end 2to1Mux

-- architecture behavioral -- use case
architecture case_bod of 2to1Mux is
begin
   process(s, a, b)
   begin
      case s is
         when '0' =>
            c <= a;
         when '1' =>
            c <= b;
         when others => -- handle unexpected value
            c <= 'z';
       end case;
   end process;
end architecture;
