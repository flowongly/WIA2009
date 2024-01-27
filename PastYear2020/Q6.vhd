library IEEE;
use IEEE.std_logic_1164.all;

entity priority is
    port (
       w : in std_logic_vector(3 downto 0);
       y : out std_logic_vector(1 downto 0);
       z : out std_logic
    );
end priority;

architecture behavior of priority is
begin
    -- rewrite using if then else (sequential)
    p_priority : process(w)
    begin
        if w(3) = '1' then
            y <= "11";
        elsif w(2) = '1' then
            y <= "10";
        elsif w(1) = '1' then
            y <= "01";
        else
            y <= "00"; -- default state
        end if;
        
        if w = "0000" then
            z <= '0';
        else
            z <= '1'; -- default state
        end if;
    end process p_priority;
end behavior;
