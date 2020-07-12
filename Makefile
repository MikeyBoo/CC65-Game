build:
	cl65 -t pce -o game.nes main.c 

clean:
	del *.pce

run:
	EmuHawk ./game.pce
