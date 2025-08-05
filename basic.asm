		device	zxspectrum48

		org	0
		incbin	SRC_FILE
pic_len = $-6-19					; 19 bytes of prefix & 6 byte of suffix

;------------------------------------------------------- ----- ---- --- -- - -  -   -    -     -

		org	0
basic_start
		db	0,10					; line number
		dw	basic_end-line_start		; line lenght
line_start
		db	#e7,#b0,#22,"0",#22,#3a,#fb,#3a		; border val "0" : cls :
		db	#f4,#b0,#22,"23659",#22,#2c,#c3,#a7	; poke val "23659", not pi	; not pi = 0
		db	#3a,#f5,#22			; : print "
		incbin	SRC_FILE,19,pic_len
		db	#22,#3a					; " :
		db	#f4,#b0,#22,"23659",#22,#2c,#bb,#a7	; poke val "23659", sqr pi	; sqr pi = 2
		db	#3a,#f2,#c3,#a7			; : pause not pi
		db	#0d
basic_end
;------------------------------------------------------- ----- ---- --- -- - -  -   -    -     -

		emptytap  TAP_FILE
		savetap   TAP_FILE,basic,"specscii",0,basic_end,10,basic_end-basic_start

		emptytrd  TRD_FILE
		savetrd   TRD_FILE,"boot.B",0,basic_end,10,basic_end
