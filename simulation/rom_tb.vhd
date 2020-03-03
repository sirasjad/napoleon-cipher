-- Encoder/decoder component testbench
library ieee;
use ieee.std_logic_1164.all;

entity rom_tb is
    --
end rom_tb;

architecture arch of rom_tb is
    component rom is
        Port(
            dIn: in std_logic_vector(7 downto 0);
            dOut: out std_logic_vector(7 downto 0)
        );
    end component;

    constant clock_time: time := 10 ns;
    signal data_in: std_logic_vector(7 downto 0);
    signal data_out: std_logic_vector(7 downto 0);
    signal clk: std_logic;

begin
    data_rom: rom port map(
        dIn => data_in,
        dOut => data_out
    );

    clock: process
    begin
        clk <= '0';
        wait for clock_time/2;
        clk <= '1';
        wait for clock_time/2;
    end process;

    sim: process 
    begin
        -- Encode from ASCII code to offset (ex. 97 -> 0)
        data_in <= "01100001"; -- A
        wait for clock_time;
        data_in <= "01100010"; -- B
        wait for clock_time;
        data_in <= "01100011"; -- C
        wait for clock_time;
        data_in <= "01100100"; -- D
        wait for clock_time;
        data_in <= "01100101"; -- E 
        wait for clock_time;
        data_in <= "01100110"; -- F
        wait for clock_time;

        -- Decode from offset to ASCII code (ex. 0 ->97)
        data_in <= "00000000";
        wait for clock_time;
        data_in <= "00011001";
        wait;
    end process;
end arch;
