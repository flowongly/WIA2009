-- signals a,b,c,d and e are std_logic_vectors with an index from 7 downto 0
-- what is the value, expressed as a string consisting of onlu 0s and 1s, assigned to each target signal ? 
-- If an assignments is invalid, explain why

a <= X"8_2"; -- hexadecimal 0x82, in binary 0x82 is 10000010
b <= b"01101101"; -- binary value of 01101101
c <= "00" & o"46"; -- octal value 
d <= "1101_0011"; --11010011 -- _ is valid to increade the readability
e <= x"AC"; --0xAC is hexadecimal A(10) = 1010 C(12) = 1100, so in binary is 10101100
