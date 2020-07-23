build:
	cc65 -O -t c64 game.c
	ca65 game.s
	ca65 -t c64 text.s
	ld65 -o game.prg -t c64 -Ln game.lbl -m game.map game.o text.o c64.lib

#easy method 'cl65 -O game.c text.s'

run:
	x64sc game.prg

clean:
	del *.lbl *.map *.o *.prg game.s