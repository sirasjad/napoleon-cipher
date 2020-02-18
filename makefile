all:
	@ghdl -a rom.vhd rom_tb.vhd
	@ghdl -a key_rom.vhd key_rom_tb.vhd
	@ghdl -e rom_tb
	@ghdl -e key_rom_tb

sim:
	@./rom_tb --vcd=rom_tb.vcd --no-run
	@./key_rom_tb --vcd=rom_tb.vcd --no-run
	@/Applications/gtkwave.app/Contents/Resources/bin/gtkwave key_rom_tb.vcd

clean:
	@rm -f rom rom_tb key_rom key_rom_tb
	@rm -f *.o *.cf *.vcd
