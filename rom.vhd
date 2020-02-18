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
    -- ASCII binary character table
    dOut <= "00000000" when dIn = "01100001" else -- A
            "00000001" when dIn = "01100010" else -- B
            "00000010" when dIn = "01100011" else -- C
            "00000011" when dIn = "01100100" else -- D
            "00000100" when dIn = "01100101" else -- E
            "00000101" when dIn = "01100110" else -- F
            "00000110" when dIn = "01100111" else -- G
            "00000111" when dIn = "01101000" else -- H
            "00001000" when dIn = "01101001" else -- I
            "00001001" when dIn = "01101010" else -- J
            "00001010" when dIn = "01101011" else -- K
            "00001011" when dIn = "01101100" else -- L
            "00001100" when dIn = "01101101" else -- M
            "00001101" when dIn = "01101110" else -- M
            "00001110" when dIn = "01101111" else -- O
            "00001111" when dIn = "01110000" else -- P
            "00010000" when dIn = "01110001" else -- Q
            "00010001" when dIn = "01110010" else -- R
            "00010010" when dIn = "01110011" else -- S
            "00010011" when dIn = "01110100" else -- T
            "00010100" when dIn = "01110101" else -- U
            "00010101" when dIn = "01110110" else -- V
            "00010110" when dIn = "01110111" else -- W
            "00010111" when dIn = "01111000" else -- X
            "00011000" when dIn = "01111001" else -- Y
            "00011001" when dIn = "01111010"; -- Z
end arch;
