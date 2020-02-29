library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity encryption is
    Port(
        dataIn: in std_logic_vector(7 downto 0); -- Data input (plaintext)
        keyIn: in std_logic_vector(7 downto 0); -- Key input
        dataOut: out std_logic_vector(7 downto 0); -- Data output (ciphertext)
        clk: in std_logic; -- Internal clock
        clr: in std_logic -- Clear
    );
end encryption;

architecture arch of encryption is
    signal ciphertext: integer;

begin
    process(clk, clr)
    begin
        if(clr = '1') then
            dataOut <= (others => '0');
            
        elsif(rising_edge(clk)) then
            -- Formula: (keyIn + (25 - dataIn) mod 25)
            ciphertext <= (to_integer(unsigned(keyIn)) + (25 - to_integer(unsigned(dataIn)))) mod 25;
            dataOut <= std_logic_vector(to_signed(ciphertext, 8)); -- Integer to std_logic_vector
            -- Why signed and not unsigned??
        end if;
    end process;
end arch;
