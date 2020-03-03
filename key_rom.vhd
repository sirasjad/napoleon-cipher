library ieee;
use ieee.std_logic_1164.all;

entity key_rom is
    Port(
        dOut: out std_logic_vector(7 downto 0);
        clk: in std_logic
    );
end key_rom;

architecture arch of key_rom is
    signal index: std_logic_vector(2 downto 0) := "000";

begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(index = "000") then
                dOut <= "01100001"; -- a
                index <= "001";
            elsif(index = "001") then
                dOut <= "01110000"; -- p
                index <= "010";
            elsif(index = "010") then
                dOut <= "01110000"; -- p
                index <= "011";
            elsif(index = "011") then
                dOut <= "01101100"; -- l
                index <= "100";
            elsif(index = "100") then
                dOut <= "01100101"; -- e
                index <= "000";
            end if;
        end if;
    end process;
end arch;
