-- Top-level implementation
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    Port(
        dataIn: in std_logic_vector(7 downto 0); -- Data input (plaintext)
        keyIn: in std_logic_vector(7 downto 0); -- Key input
        dataOut: out std_logic_vector(7 downto 0); -- Data output (ciphertext)
        clk: in std_logic; -- Internal clock
        clr: in std_logic -- Clear
    );
end top;

architecture arch of top is
    -- Encryption component
    component encryption is
        Port(
            dataIn: in std_logic_vector(7 downto 0); -- Data input (plaintext)
            keyIn: in std_logic_vector(7 downto 0); -- Key input
            dataOut: out std_logic_vector(7 downto 0) -- Data output (ciphertext)
        );
    end component;

    -- ASCII to Binary encoder/decoder component
    component rom is
        Port(
            dIn: in std_logic_vector(7 downto 0);
            dOut: out std_logic_vector(7 downto 0)
        );
    end component;

    -- Key encoder component
    --component key_rom is
        --Port(
            --dOut: out std_logic_vector(7 downto 0);
            --clk: in std_logic
        --);
    --end component;

    signal rom_to_cipher: std_logic_vector(7 downto 0);
    signal keyrom_to_cipher: std_logic_vector(7 downto 0);
    signal cipher_to_rom: std_logic_vector(7 downto 0);
    --signal key: std_logic_vector(7 downto 0);

begin
    data_encoder: rom port map(
        dIn => dataIn,
        dOut => rom_to_cipher
    );

    --key_generator: key_rom port map(
        --dOut => key,
        --clk => clk
    --);

    key_encoder: rom port map(
        --dIn => key,
        dIn => keyIn,
        dOut => keyrom_to_cipher
    );

    cipher: encryption port map(
        dataIn => rom_to_cipher,
        keyIn => keyrom_to_cipher,
        dataOut => cipher_to_rom
    );

    decoder: rom port map(
        dIn => cipher_to_rom,
        dOut => dataOut
    );
end arch;
