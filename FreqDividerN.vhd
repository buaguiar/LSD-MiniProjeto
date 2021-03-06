library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.NUMERIC_STD.all; 

entity FreqDividerN is
	generic(N : positive);
	port(reset	: in  std_logic;
		  clkIn	: in  std_logic;
		  clkOut	: out std_logic);
end FreqDividerN;
  
architecture Behavioral of FreqDividerN is

	signal s_FreqDivCount : natural;

begin
	process(reset, clkIn)
	begin
		if (reset = '1') then
			clkOut		 <= '0';
			s_FreqDivCount <= 0;
		elsif (rising_edge(clkIn)) then
			if (s_FreqDivCount = N - 1) then
				clkOut		 <= '0';
				s_FreqDivCount <= 0;
			else
				if (s_FreqDivCount = (N / 2 - 1)) then
					clkOut <= '1';
				end if;
				s_FreqDivCount <= s_FreqDivCount + 1;
			end if;
		end if;
	end process;
end Behavioral;
