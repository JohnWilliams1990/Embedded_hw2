//; John Williams
//; 105201054
//; February 12, 2019
//; Homework 2 
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; DDRD -> pins |0|1|2|3|4|5|6|7|
;         num  |0|1|2|3|4|5|6|7|
; 
; DDRB -> pins |8|9|10|11|12|13|
;         num  |0|1|2 |3 |4 |5 |
;
; DDRD -> pins |14|15|16|17|18|19|
;         num  |0 |1 |2 |3 |4 |5 |
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; set pins as output
; sbi DDR[B,C,D] [pin number]
; set pins as input
; cbi DDR[B,C,D] [pin number]
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; light pins 
; sbi PORT[B,C,D] [pin number]
; clear pins 
; sbi PORT[B,C,D] [pin number]
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#define __SFR_OFFSET 0 
#include "avr/io.h"
.global start
.global blink

#define time 19; number of iteratons used for delay 

start:  
  sbi DDRD, 1 ; --> set pin 2 to be output pin; 
  sbi DDRD, 3 ; --> set pin 2 to be output pin; 
  sbi DDRD, 5 ; --> set pin 2 to be output pin; 
  sbi DDRD, 7 ; --> set pin 2 to be output pin; 
ret
  
blink:

  sbi PORTD, 1 ; led on  ; set pin to high ;
  call delay
  cbi PORTD, 1 ; led off ; set pin to low
  call delay

  sbi PORTD, 3 ; led on  ; set pin to high ;
  call delay
  cbi PORTD, 3 ; led off ; set pin to low
  call delay

  sbi PORTD, 5 ; led on  ; set pin to high ;
  call delay
  cbi PORTD, 5 ; led off ; set pin to low
  call delay

  sbi PORTD, 7 ; led on  ; set pin to high ;
  call delay
  cbi PORTD, 7 ; led off ; set pin to low
  call delay
ret

; Delay: function used to setup delay based on the r20 register
; colockcycle = 20*10^(-6)
; 20*10^(-6) * 65,536 * 4 = 0.0131072 s -OR-13.1072 ms
; 255 ms / 13.1072 ms = 19.4549560546875
; with 20 loops gives us 262.148 ms
; with 19 loops gives us 249.040 ms
; 19 loops is closer to 255 ms

delay:
ldi r20, time
  delay_loops:
  ldi r31, 255;
  ldi r30, 255;
  loop1:
    sbiw r30,1;  --> 2 clockcycle
    brne loop1;  --> 2 clockcycle
  subi r20, 1
  brne delay_loops
ret
