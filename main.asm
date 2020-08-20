    .list
    .mlist

    .bank $0
    .org $e000
    .code

;using pceas2

RESET:
    sei             ;disable interrupts
    csh             ;clock set high
    cld             ;clear decimal mode
    lda #$ff        ;map in I/O
    tam #0          ;memory page 0
    tax             ;$ff to x-register
    lda #$f8        ;map in RAM
    tam #1          ;mpr1

    txs
    lda $0000
    lda #$07
    sta $1402       ;IRQ mask

    st0 #5          ;disable VDC interrupt, screen OFF
    st1 #0          ;low byte
    st2 #0          ;high byte


    lda #$de
    sta $2010
    lda #$ad
    sta $2011

    pha
    dec a
    pha

    ldx #1
.loop
    stz $0402
    stx $0403
    sta $0404
    inc a
    bne .next
    iny
.next
    sty $0405
    pha
    pla
    pha
    pla
    bra .loop



    .org $fffe
    .dw RESET