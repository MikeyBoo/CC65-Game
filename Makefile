build:
	cc65 -Ors --codesize 500 -T -g -t c64 game.c
	ca65 game.s
	ld65 -o game.prg -t c64 -Ln game.lbl -m game.map game.o c64.lib

run:
	x64sc game.prg

clean:
	del *.lbl *.map *.o *.prg