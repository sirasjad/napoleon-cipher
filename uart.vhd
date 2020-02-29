library ieee;
use ieee.std_logic_1164.all;

entity uart is
    Port(
        dIn: in std_logic_vector(7 downto 0);
        dOut: out std_logic_vector(7 downto 0)
    );
end uart;

architecture arch of uart is
begin

end arch;
