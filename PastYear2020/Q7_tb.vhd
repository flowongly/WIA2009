library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; -- Added for std_logic_unsigned package

entity tb_mealy is
end tb_mealy;

architecture behavioral of tb_mealy is

  -- input signals
  signal clk_tb   : std_logic := '0';
  signal rst_tb   : std_logic := '0';
  signal input_tb : std_logic := '0';

  -- output signals
  signal output_tb : std_logic;

  -- declare component going to use in testbench
  component mealy_fsm 
    port(
      clk    : in  std_logic;
      rst    : in  std_logic;
      input  : in  std_logic;
      output : out std_logic
    );
  end component;

  -- clock period definition
  constant clk_period : time := 20 ns;

begin -- begin architecture here

  -- instantiate the Unit Under Test (UUT)
  uut : mealy_fsm 
    port map(
      clk    => clk_tb,
      rst    => rst_tb,
      input  => input_tb,
      output => output_tb
    );

  -- IMPORTANT: clock process definition
  clk_process : process
  begin
    clk_tb <= '0';
    wait for clk_period/2;
    clk_tb <= '1';
    wait for clk_period/2;
  end process;

  -- stimulus process
  stim_process : process
  begin
    rst_tb   <= '1';  -- default state
    wait for 100 ns;

    rst_tb   <= '0';
    input_tb <= '0';
    wait for 20 ns;

    rst_tb   <= '0';
    input_tb <= '1';
    wait for 20 ns;

    wait;
  end process;

end behavioral;




