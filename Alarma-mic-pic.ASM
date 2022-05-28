
	list	p=16f84
	include <p16f84.inc>
;
;*************************************************************
;       PROGRAMA PARA LA ALARMA DE LA PLANTA BAJA (PRINCIPAL)
;	Sin usar el PRESCALER
;	Eduardo j. Riera
;*************************************************************
;*************************************************************
store 	equ	h'15'
serie1 	equ	h'16'
count1	equ	h'14'
count	equ	h'10'
largo	equ	h'11'	
porta	equ	h'05'
portb	equ	h'06'
trisa	equ	h'85'
trisb	equ	h'86'
status	equ	h'03'
rp0	equ	h'05'
dato	equ	h'12'
serie	equ	h'13'
igual	equ	h'17'
almacen	equ	h'18'
bits	equ	h'19'
intcon	equ	h'0B'
;---------------------------------
	org	h'08'
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
;
start
	bsf	status, rp0
	movlw	h'BF'	;10111111 
	movwf	trisb
	movlw	h'01'
	movwf	trisa
	bcf	status, rp0
;
	clrf	largo
	clrf	portb
;***************************************************************************
;*********Subrutina de stanby***********************************************
;*********Subrutina de alerta***********************************************
;***************************************************************************
	bsf	porta,1
;
aqui	
	btfss	portb,7
	call	puertob71
;	btfss	portb,0		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	call	puertob01	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	btfss	largo,0		;salto si alarma activa
	goto	aqui
	goto	eeeee
valor
	bsf	largo,0	
	goto	in
;---------------------------------------------------------------------------
eeeee
	btfss	portb,0
	call	puertob02
	btfss	portb,1
	call	puertob1
	btfss	portb,2
	call	puertob2
	btfss	portb,3
	call	puertob3
	btfss	portb,4
	call	puertob4
	btfss	portb,5
	call	puertob5
	btfss	porta,0
	call	puertoa0
	bsf	porta,1
	call	retardo
	bcf	porta,1
	call	retardo
	goto	aqui
;---------Subrutina de contador-----------------
;---Se viene aca cada vez que hay una llamada---
;-----------------------------------------------
retardo
	movlw	h'40'
	movwf	count1
retar
	movlw	h'ff'
	movwf	count
decrem
	decfsz	count,1	
	goto	decrem
	decfsz	count1,1
	goto	retar
	return
;---------Subrutina de chequeo del bit -------
;---Se viene aca cuando se pulsa el llavero---
in11
	btfss	largo,0
	goto 	in1
;
	bsf	portb,6		;
	call	retardo1	;
	bcf	portb,6		;
	call	retardo1	;Guiñada alarma desactivada
	bsf	portb,6		;
	call	retardo1	;
	bcf	portb,6		;
;	
	bcf	porta,1
	bcf	portb,6
	bcf	largo,0
enable1
	btfss	portb,7
	goto 	enable1
	goto	aqui
;	
;---------Subrutina de verificacion in1-------
;---Se viene aca cuando se pulsa el llavero---

in1
	btfsc	largo,0
	goto	in11
;
	bsf	portb,6		;
	call	retardo1	;Guiñada alarma activada
	bcf	portb,6		;
;
	bcf 	porta,1
	bsf 	largo,0	
enable
	btfss	portb,7
	goto	enable
	goto	aqui
;
;---Subrrutina de retardo corto---
;	
retardo1
	movlw	h'15'
	movwf	count1
retar1
	movlw	h'ff'
	movwf	count
decrem1
	decfsz	count,1	
	goto	decrem1
	decfsz	count1,1
	goto	retar1
	return
;
;---------Subrutina de Panico (Suena la Sirena)-----------
;
in
	bsf	portb,6
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo
	btfss	portb,7
	goto	volver
	call	retardo

	bcf	portb,6	
	goto 	aqui
volver
	bcf	portb,6
	bcf	porta,1
	call	retardo
	call	retardo
	call	retardo
	goto	in11
;
;****************************************************************
;************ Subrrutina verificadora del puerto B,0 ************
;************ Sin activar la alarma		     ************
;****************************************************************
;
;puertob01
;
;	movlw	h'50'
;	movwf	count1
;eeretar1
;	movlw	h'ff'
;	movwf	count
;eedecrem1
;	decfsz	count,1	
;	goto	eedecrem1
;	decfsz	count1,1
;	goto	eeretar1
;	btfsc	portb,0
;	return
;	bsf	largo,0	
;	goto	in	
;
;***************************************************************
;************ Subrutina verificadora del puerto B,0 ************
;************ Con la alarma activada                ************
;***************************************************************
;
puertob02
;
	movlw	h'50'
	movwf	count1
eeretar1b
	movlw	h'ff'
	movwf	count
eedecrem1b
	decfsz	count,1	
	goto	eedecrem1b
	decfsz	count1,1
	goto	eeretar1b
	btfsc	portb,0
	return
	goto	in	
;
;***************************************************************
;************ Subrutina verificadora del puerto B,1 ************
;***************************************************************
;
puertob1
;
	movlw	h'50'
	movwf	count1
eeretar1c
	movlw	h'ff'
	movwf	count
eedecrem1c
	decfsz	count,1	
	goto	eedecrem1c
	decfsz	count1,1
	goto	eeretar1c
	btfsc	portb,1
	return
	goto	in	
;
;***************************************************************
;************ Subrutina verificadora del puerto B,2 ************
;***************************************************************
;
;
puertob2
;
	movlw	h'50'
	movwf	count1
eeretar1d
	movlw	h'ff'
	movwf	count
eedecrem1d
	decfsz	count,1	
	goto	eedecrem1d
	decfsz	count1,1
	goto	eeretar1d
	btfsc	portb,2
	return
	goto	in	
;
;***************************************************************
;************ Subrutina verificadora del puerto B,3 ************
;***************************************************************
;
;
puertob3
;
	movlw	h'50'
	movwf	count1
eeretar1e
	movlw	h'ff'
	movwf	count
eedecrem1e
	decfsz	count,1	
	goto	eedecrem1e
	decfsz	count1,1
	goto	eeretar1e
	btfsc	portb,3
	return
	goto	in	
;
;***************************************************************
;************ Subrutina verificadora del puerto B,4 ************
;***************************************************************
;
;
puertob4
;
	movlw	h'50'
	movwf	count1
eeretar1f
	movlw	h'ff'
	movwf	count
eedecrem1f
	decfsz	count,1	
	goto	eedecrem1f
	decfsz	count1,1
	goto	eeretar1f
	btfsc	portb,4
	return
	goto	in	
;
;***************************************************************
;************ Subrutina verificadora del puerto B,5 ************
;***************************************************************
;
;
puertob5
;
	movlw	h'50'
	movwf	count1
eeretar1g
	movlw	h'ff'
	movwf	count
eedecrem1g
	decfsz	count,1	
	goto	eedecrem1g
	decfsz	count1,1
	goto	eeretar1g
	btfsc	portb,5
	return
	goto	in	
;
;***************************************************************
;************ Subrutina verificadora del puerto B,6 ************
;***************************************************************
;
;
puertob6
;
	movlw	h'50'
	movwf	count1
eeretar1h
	movlw	h'ff'
	movwf	count
eedecrem1h
	decfsz	count,1	
	goto	eedecrem1h
	decfsz	count1,1
	goto	eeretar1h
	btfsc	portb,6
	return
	goto	in	
;
;***************************************************************
;************ Subrutina verificadora del puerto B,7 ************
;************ Con la alarma desactivada             ************
;***************************************************************
;
;
puertob71
;
	movlw	h'30'
	movwf	count1
eeretar1i
	movlw	h'ff'
	movwf	count
eedecrem1i
	decfsz	count,1	
	goto	eedecrem1i
	decfsz	count1,1
	goto	eeretar1i
	btfsc	portb,7
	return
	goto	in1	
;
;***************************************************************
;************ Subrutina verificadora del puerto B,7 ************
;************ Con la alarma activada                ************
;***************************************************************
;
;
puertob72
;
	movlw	h'30'
	movwf	count1
eeretar1j
	movlw	h'ff'
	movwf	count
eedecrem1j
	decfsz	count,1	
	goto	eedecrem1j
	decfsz	count1,1
	goto	eeretar1j
	btfsc	portb,7
	return
	goto	volver	
;
;***************************************************************
;************ Subrutina verificadora del puerto A,0 ************
;***************************************************************
;
;
puertoa0
;
	movlw	h'50'
	movwf	count1
eeretar1k
	movlw	h'ff'
	movwf	count
eedecrem1k
	decfsz	count,1	
	goto	eedecrem1k
	decfsz	count1,1
	goto	eeretar1k
	btfsc	porta,0
	return
	goto	in	
;
	end



