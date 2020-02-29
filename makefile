all:
	@ghdl -a rom.vhd simulation/rom_tb.vhd
	@ghdl -a key_rom.vhd
	@ghdl -a encryption.vhd simulation/encryption_tb.vhd
	@ghdl -e rom_tb
	@ghdl -e encryption_tb

test:
	@ghdl -a encryption.vhd

sim:
	@./rom_tb --vcd=rom_tb.vcd --stop-time=100ns
	@./encryption_tb --vcd=encryption_tb.vcd --stop-time=100ns
	@/Applications/gtkwave.app/Contents/Resources/bin/gtkwave encryption_tb.vcd

clean:
	@rm -f rom_tb key_rom_tb encryption_tb
	@rm -f *.o *.cf *.vcd

build:
	@make clean
	@make all
	@make sim
	@make clean
