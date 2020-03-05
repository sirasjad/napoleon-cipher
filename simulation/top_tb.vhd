-- Top-level implementation testbench
library ieee;
use ieee.std_logic_1164.all;

entity top_tb is
    --
end top_tb;

architecture arch of top_tb is
    component top is
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
    toplevel: top port map(
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
        clr <= '0';
        
        data_in <= "01101101"; -- M
        key_in <= "01101010"; -- J
        wait for clock_time;

        data_in <= "01100001"; -- A
        key_in <= "01100101"; -- E
        wait for clock_time;

        data_in <= "01101011"; -- K
        key_in <= "01100001"; -- A
        wait for clock_time;
        
        data_in <= "01100101"; -- E
        key_in <= "01101110"; -- N
        wait for clock_time;

        data_in <= "01100101"; -- E
        key_in <= "01101010"; -- J
        wait for clock_time;

        data_in <= "01110110"; -- V
        key_in <= "01100001"; -- A
        wait for clock_time;

        data_in <= "01100101"; -- E
        key_in <= "01100011"; -- C
        wait for clock_time;

        data_in <= "01110010"; -- R
        key_in <= "01110001"; -- Q
        wait for clock_time;

        data_in <= "01111001"; -- Y
        key_in <= "01110101"; -- U
        wait for clock_time;
        wait;
    end process;
end arch;
