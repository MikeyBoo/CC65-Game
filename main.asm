    .list
    .mlist

    .bank $0
    .org $e000
    .code

RESET:
    sei
    csh             ;clock set high
    cld
    lda #$ff        ;map in I/O
    tam #0
    tax
    lda #$f8        ;map in RAM
    tam #1

    txs
    lda $0000
    lda #$07
    sta $1402       ;IRQ mask

    st0 #5          ;disable VDC interrupt, screen OFF
    st1 #0
    st2 #0


    lda #$de
    sta $2010
    lda #$ad
    sta $2011

    pha
    dec a
    pha

.loop
    bra .loop



    .org $fffe
    .dw RESET