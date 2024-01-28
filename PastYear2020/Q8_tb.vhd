library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 

entity gray_tb is
end gray_tb;

architecture behavioral of gray_tb is

  -- declare signal
  signal v_tb : std_logic :='0'; -- default v
  signal clock_tb : std_logic := '0';
  signal output_tb : std_logic;
  
  -- declare constant clock period
  constant clock_period :time := 20 ns;
  
  -- declare component
  component graycounter 
  port(
    v, clock :in std_logic;
    output : out std_logic
  );
  end component;
  
begin

  uut : graycounter
  port map(
  v => v_tb,
  clock => clock_tb,
  output => output_tb
  );
  
  -- clock process definitions 
  clock_process : process
  begin
     clock_tb <= '0';
     wait for clock_period/2;
     clock_tb <= '1';
     wait for clock_period/2;
  end process;
  
  -- stimulus process
  stim_process : process
  begin
    v_tb <= '0';
    wait for 20 ns;
  
    v_tb <= '1';
    wait for 20 ns;
  
    wait;
  end process;
end behavioral;
