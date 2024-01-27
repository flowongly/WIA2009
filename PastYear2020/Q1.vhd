--given the signal delcarations
signal a,b : std_logic_vector (3 downto 0)
signal p,q : std_logic_vector (7 downto 0)

--give the value signal (a, p, b, p) as the strings of only 0s and 1s after the following assignments
a <= (2 => '1', 1 => '0', 0 => '0', 3 =>'1'); --1001
p <= (7|5|3 => '1', others -> '0'); --10101001
b <= (others => '0'); --0000
1 <= (6 downto 4 => '0', others => '1'); --11110001


