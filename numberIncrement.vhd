-- Incrementa o valor 1 desde o número 1 até ao número 50, que é o intervalo jogável dos números do Euromilhões.

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity numberIncrement is
	port( clk    : in  std_logic;
			reset  : in  std_logic;
			input  : in  std_logic_vector(5 downto 0);
			load   : out std_logic;
         incrementOut: out std_logic_vector(29 downto 0));
end numberIncrement;

architecture Behavioral of numberIncrement is

	signal s_count : unsigned(2 downto 0);
	signal s_incrementOut : std_logic_vector(29 downto 0);

begin
	process( clk )
	begin
		if( rising_edge(clk) ) then
			if (reset = '1') then
				s_count <= "000";
				load <= '0';
			elsif ( s_count = "101" ) then -- Quando o contador chegar a 5 para, porque o número máximo de vezes
				s_count <= s_count;		    -- que o utilizador pode jogar neste jogo é de 5 vezes.
				load <= '1';
			elsif (input = "000000" or input >= "110011") then -- Intervalo de 1 a 50.
				s_count <= s_count;
			else
				s_incrementOut <= input & s_incrementOut(29 downto 6); -- 24 elementos. cada número tem 6 bits. 24/6 = 4.
				s_count <= s_count + 1;                                -- São os 4 bits que se guardam + o último, o input.
			end if;
		end if;
	end process;
	
	incrementOut <= s_incrementOut;

end Behavioral;