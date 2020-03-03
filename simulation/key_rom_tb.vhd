-- Key encoder component testbench
library ieee;
use ieee.std_logic_1164.all;

entity key_rom_tb is
    --
end key_rom_tb;

architecture arch of key_rom_tb is
    component key_rom is
        Port(
            dOut: out std_logic_vector(7 downto 0);
            clk: in std_logic
        );
    end component;

    constant clock_time: time := 10 ns;
    signal data_out: std_logic_vector(7 downto 0);
    signal clk: std_logic;

begin
    key_encoder: key_rom port map(
        dOut => data_out,
        clk => clk
    );

    clock: process
    begin
        clk <= '0';
        wait for clock_time/2;
        clk <= '1';
        wait for clock_time/2;
    end process;
end arch;
