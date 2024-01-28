library ieee;
use ieee.std_logic_1164.all;

entity graycounter is
  port (
    v, clock : in std_logic;
    output : out std_logic
  );
end graycounter;

architecture behavioral of graycounter is

  -- declare the state
  constant state_a : std_logic_vector (2 downto 0) := "000";
  constant state_b : std_logic_vector (2 downto 0) := "001";
  constant state_c : std_logic_vector (2 downto 0) := "011";
  constant state_d : std_logic_vector (2 downto 0) := "010";
  constant state_e : std_logic_vector (2 downto 0) := "110";
  constant state_f : std_logic_vector (2 downto 0) := "111";
  constant state_g : std_logic_vector (2 downto 0) := "101";
  constant state_h : std_logic_vector (2 downto 0) := "100";

  -- declare signal present_state, next_state
  signal present_state, next_state : std_logic_vector (2 downto 0);

begin
  process (clock)
  begin
    if rising_edge(clock) then
      present_state <= next_state;
    end if;
  end process;

  graycode_process : process (present_state, v)
  begin
    case present_state is
      when state_a =>
        if v = '0' then
          next_state <= state_b;
        else
          next_state <= state_a;
        end if;
      when state_b =>
        if v = '0' then
          next_state <= state_c;
        else
          next_state <= state_a;
        end if;
      when state_c =>
        if v = '0' then
          next_state <= state_d;
        else
          next_state <= state_b;
        end if;
      when state_d =>
        if v = '0' then
          next_state <= state_e;
        else
          next_state <= state_c;
        end if;
      when state_e =>
        if v = '0' then
          next_state <= state_f;
        else
          next_state <= state_d;
        end if;
      when state_f =>
        if v = '0' then
          next_state <= state_g;
        else
          next_state <= state_e;
        end if;
      when state_g =>
        if v = '0' then
          next_state <= state_h;
        else
          next_state <= state_f;
        end if;
      when state_h =>
        if v = '0' then
          next_state <= state_h;
        else
          next_state <= state_g;
        end if;
      when others =>
        next_state <= state_a;
    end case;

    output <= present_state(0); -- Assuming you want to output the LSB of the state
  end process;
