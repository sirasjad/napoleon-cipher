library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity encryption is
    Port(
        dataIn: in std_logic_vector(7 downto 0); -- Data input (plaintext)
        keyIn: in std_logic_vector(7 downto 0); -- Key input
        dataOut: out std_logic_vector(7 downto 0) -- Data output (ciphertext)
    );
end encryption;

architecture arch of encryption is
    signal ciphertext: integer;

begin
    ciphertext <= (to_integer(unsigned(keyIn)) + (26 - to_integer(unsigned(dataIn)))) mod 26;
    dataOut <= std_logic_vector(to_signed(ciphertext, 8));

    --process(clk)
    --begin
        --if(rising_edge(clk)) then
            -- Formula: (keyIn + (26 - dataIn) mod 26)
            --ciphertext <= (to_integer(unsigned(keyIn)) + (26 - to_integer(unsigned(dataIn)))) mod 26;
            --report "dataIn: " & integer'image(to_integer(unsigned(dataIn)));
            --report "keyIn: " & integer'image(to_integer(unsigned(keyIn)));
            --report "ciphertext: " & integer'image(ciphertext);
            --dataOut <= std_logic_vector(to_signed(ciphertext, 8)); -- Integer to std_logic_vector
            -- Why signed and not unsigned??
        --end if;
    --end process;
end arch;
