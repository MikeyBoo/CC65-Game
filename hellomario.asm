.segment "HEADER"
.byte "NES"
.byte $1a
.byte $02       ; 2 * 16KB PRG ROM
.byte $01       ; 1 * 8KB CHR ROM
.byte %00000000 ; mapper and mirroring
.byte $00
.byte $00
.byte $00
.byte $00
.byte $00, $00, $00, $00, $00   ;filler
.segment "ZEROPAGE"
.segment "STARTUP"
Reset:
    sei         ; disables interrupt
    cld         ; disables decimal mode

    ; disable sound irq
    ldx #$40
    stx $4017

    ; initialize the stack register
    ldx #$ff
    txs

    inx

    ; zero PPU registers
    stx $2000
    stx $2001

    stx $4010
Loop:
    jmp Loop
    
NMI:
    rti

.segment "VECTORS"
    .word NMI
    .word Reset
    ;
.segment "CHARS"
    .incbin "hellomario.chr"