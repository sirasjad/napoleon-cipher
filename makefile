all:
	@ghdl -a rom.vhd rom_tb.vhd
	@ghdl -e rom_tb

sim:
	@./rom_tb --vcd=rom_tb.vcd --no-run
	@/Applications/gtkwave.app/Contents/Resources/bin/gtkwave rom_tb.vcd

clean:
	@rm -f *.o *.cf *.vcd
	@rm -f rom rom_tb
