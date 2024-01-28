library IEEE;
use IEEE.std_logic_1164.all;

entity mealy_fsm is
port(
   clk : in std_logic;
   rst : in std_logic;
   input : in std_logic;
   output : out std_logic
);
end mealy_fsm;

-- architecture
architecture behavioral of mealy is
-- declare type state
type state_signal is (a,b,c,d);
-- delcare signal present state and next state
signal present_state, next_state : state_signal;
begin

syncronous_process : process(clk)
begin
-- declare the basic behavior
   if rising_edge(clk)then
      if(rst = '1') then -- reset = 1
        present_state <= a; -- default state
      else
        present_state <= next_state; -- state change
      end if;
   end if;
end process;

-- main process , based on the basic behavior
mealy_process : process(present_state, input)
begin
   -- declare the case
   case present_state is
   --- when current state is a
   when a =>
      if(input = '0') then
         output <= '0';
         next_state <= a;
      else
         output <= '0'
         next_state <= b;
      end if;
      
   when b =>
      if(input = '0') then
         output <= '0';
         next_state <= a;
      else
         output <= '0';
         next_state <= c;
      end if;
   
   when c =>
      if(input = '1') then
         output <= '0';
         next_state <= c;
      else
         output <= '0';
         next_state <= d;
      end if;
      
   when d =>
      if(input = '0') then
         output <= '1';
         next_state <= b;
      else
         output <= '0';
         next_state <= a;
      end if;
    end case;
end process;
end behavioral;
