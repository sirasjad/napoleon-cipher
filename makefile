all:
	@ghdl -a rom.vhd simulation/rom_tb.vhd
	@ghdl -a key_rom.vhd
	@ghdl -a encryption.vhd simulation/encryption_tb.vhd
	@ghdl -a top.vhd simulation/top_tb.vhd
	@ghdl -e rom_tb
	@ghdl -e encryption_tb
	@ghdl -e top_tb

quick:
	@ghdl -a top.vhd

sim:
	@./rom_tb --vcd=simulation/wavefiles/rom_tb.vcd --stop-time=100ns
	@./encryption_tb --vcd=simulation/wavefiles/encryption_tb.vcd --stop-time=100ns
	@./top_tb --vcd=simulation/wavefiles/top_tb.vcd --stop-time=300ns

clean:
	@rm -f rom_tb key_rom_tb encryption_tb top_tb
	@rm -f *.o *.cf

build:
	@make clean
	@make all
	@make sim
	@make clean
