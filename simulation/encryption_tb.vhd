library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity encryption_tb is
    --
end encryption_tb;

architecture arch of encryption_tb is
    component encryption is
        Port(
            dataIn: in std_logic_vector(7 downto 0); -- Data input (plaintext)
            keyIn: in std_logic_vector(7 downto 0); -- Key input
            dataOut: out std_logic_vector(7 downto 0); -- Data output (ciphertext)
            clk: in std_logic; -- Internal clock
            clr: in std_logic -- Clear
        );
    end component;

    constant clock_time: time := 10 ns;
    signal data_in: std_logic_vector(7 downto 0);
    signal key_in: std_logic_vector(7 downto 0);
    signal data_out: std_logic_vector(7 downto 0);
    signal clk: std_logic;
    signal clr: std_logic;

begin
    cipher: encryption port map(
        dataIn => data_in,
        keyIn => key_in,
        dataOut => data_out,
        clk => clk,
        clr => clr
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
        clr <= '1';
        wait for clock_time;
        clr <= '0';
        wait for clock_time;

        data_in <= "01101101"; -- M
        key_in <= "01101010"; -- J
        wait for clock_time;

        data_in <= "01100001"; -- A
        key_in <= "01100101"; -- E
        wait for clock_time;
        wait;
    end process;
end arch;
