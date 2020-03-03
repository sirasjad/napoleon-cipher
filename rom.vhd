-- Encoder/decoder component
library ieee;
use ieee.std_logic_1164.all;

entity rom is
    Port(
        dIn: in std_logic_vector(7 downto 0);
        dOut: out std_logic_vector(7 downto 0)
    );
end rom;

architecture arch of rom is
begin
    -- Encode from ASCII code to offset (ex. 97 -> 0)
    dOut <= "00000000" when dIn = "00000000" else -- NULL
            "00000001" when dIn = "01100001" else -- A
            "00000010" when dIn = "01100010" else -- B
            "00000011" when dIn = "01100011" else -- C
            "00000100" when dIn = "01100100" else -- D
            "00000101" when dIn = "01100101" else -- E
            "00000110" when dIn = "01100110" else -- F
            "00000111" when dIn = "01100111" else -- G
            "00001000" when dIn = "01101000" else -- H
            "00001001" when dIn = "01101001" else -- I
            "00001010" when dIn = "01101010" else -- J
            "00001011" when dIn = "01101011" else -- K
            "00001100" when dIn = "01101100" else -- L
            "00001101" when dIn = "01101101" else -- M
            "00001110" when dIn = "01101110" else -- M
            "00001111" when dIn = "01101111" else -- O
            "00010000" when dIn = "01110000" else -- P
            "00010001" when dIn = "01110001" else -- Q
            "00010010" when dIn = "01110010" else -- R
            "00010011" when dIn = "01110011" else -- S
            "00010100" when dIn = "01110100" else -- T
            "00010101" when dIn = "01110101" else -- U
            "00010110" when dIn = "01110110" else -- V
            "00010111" when dIn = "01110111" else -- W
            "00011000" when dIn = "01111000" else -- X
            "00011001" when dIn = "01111001" else -- Y
            "00011010" when dIn = "01111010" else -- Z
            
    -- Decode from offset to ASCII code (ex. 0 ->97)
            "01100001" when dIn = "00000001" else -- A
            "01100010" when dIn = "00000010" else -- B
            "01100011" when dIn = "00000011" else -- C
            "01100100" when dIn = "00000100" else -- D
            "01100101" when dIn = "00000101" else -- E
            "01100110" when dIn = "00000110" else -- F
            "01100111" when dIn = "00000111" else -- G
            "01101000" when dIn = "00001000" else -- H
            "01101001" when dIn = "00001001" else -- I
            "01101010" when dIn = "00001010" else -- J
            "01101011" when dIn = "00001011" else -- K
            "01101100" when dIn = "00001100" else -- L
            "01101101" when dIn = "00001101" else -- M
            "01101110" when dIn = "00001110" else -- M
            "01101111" when dIn = "00001111" else -- O
            "01110000" when dIn = "00010000" else -- P
            "01110001" when dIn = "00010001" else -- Q
            "01110010" when dIn = "00010010" else -- R
            "01110011" when dIn = "00010011" else -- S
            "01110100" when dIn = "00010100" else -- T
            "01110101" when dIn = "00010101" else -- U
            "01110110" when dIn = "00010110" else -- V
            "01110111" when dIn = "00010111" else -- W
            "01111000" when dIn = "00011000" else -- X
            "01111001" when dIn = "00011001" else -- Y
            "01111010" when dIn = "00011010"; -- Z
end arch;
