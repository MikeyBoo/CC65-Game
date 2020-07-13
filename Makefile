build:
	ca65 hellomario -o hellomario.o --debug-info
	ld65 hellomario.o -o hellomario.nes -t nes --dgbfile mellomario.dbgfile

clean:
	del *.nes

run:
	EmuHawk ./hellomario.nes
