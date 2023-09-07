.syntax unified
.global main

.type set_bit, %function
@ args:
@ r1: base address
@ r2: offset
@ r3: bit index
@
set_bit:
  push {r4, lr}
  mov r4, 0b1
  ldr r0, [r1, r2]
  lsl r3, r4, r3
  orr r0, r0, r3
  str r0, [r1, r2]
  pop {r4, lr}
  bx lr
.size set_bit, .-set_bit

.type clear_bit, %function
@ args:
@ r1: base address
@ r2: offset
@ r3: bit index
@
clear_bit:
  push {r4, lr}
  movs r4, 0b1
  ldr r0, [r1, r2]
  lsl r3,r4,r3
  bic r0,r0,r3
  str r0 ,[r1, r2]
  pop {r4, lr}
  bx lr
.size clear_bit, .-clear_bit

@ Setting Columns 
set_column1:
  push {r3, lr}
  ldr r3, =#28
  bl set_bit
  pop {r3, lr}
  bx lr

set_column2:
  push {r3, lr}
  ldr r3, =#11
  bl set_bit
  pop {r3, lr}
  bx lr

set_column3:
  push {r3, lr}
  ldr r3, =#31
  bl set_bit
  pop {r3, lr}
  bx lr

set_column4:
  push {r1, r3, lr}
  add r1, r1, 0x00000300
  ldr r3, =#5
  bl set_bit
  pop {r1, r3, lr}
  bx lr

set_column5:
  push {r3, lr}
  ldr r3, =#30
  bl set_bit
  pop {r3, lr}
  bx lr

@ Setting Rows
set_row1:
  push {r3, lr}
  ldr r3, =#21
  bl set_bit
  pop {r3, lr}
  bx lr
  
set_row2:
  push {r3, lr}
  ldr r3, =#22
  bl set_bit
  pop {r3, lr}
  bx lr
  
set_row3:
  push {r3, lr}
  ldr r3, =#15
  bl set_bit
  pop {r3, lr}
  bx lr
  
set_row4:
  push {r3, lr}
  ldr r3, =#24
  bl set_bit
  pop {r3, lr}
  bx lr

set_row5:
  push {r3, lr}
  ldr r3, =#19
  bl set_bit
  pop {r3, lr}
  bx lr

@ Turn on the light
turn_on_row1:
  push {r2, r3, lr}
  ldr r2, =0x504
  ldr r3, =#21
  bl set_bit
  pop {r2, r3, lr}
  bx lr

turn_on_row2:
  push {r2, r3, lr}
  ldr r2, =0x504
  ldr r3, =#22
  bl set_bit
  pop {r2, r3, lr}
  bx lr

turn_on_row3:
  push {r2, r3, lr}
  ldr r2, =0x504
  ldr r3, =#15
  bl set_bit
  pop {r2, r3, lr}
  bx lr

turn_on_row4:
  push {r2, r3, lr}
  ldr r2, =0x504
  ldr r3, =#24
  bl set_bit
  pop {r2, r3, lr}
  bx lr

turn_on_row5:
  push {r2, r3, lr}
  ldr r2, =0x504
  ldr r3, =#19
  bl set_bit
  pop {r2, r3, lr}
  bx lr

@ Clear Columns
clear_column1:
  push {r3, lr}
  ldr r3, =#28
  bl clear_bit
  pop {r3, lr}
  bx lr

clear_column2:
  push {r3, lr}
  ldr r3, =#11
  bl clear_bit
  pop {r3, lr}
  bx lr

clear_column3:
  push {r3, lr}
  ldr r3, =#31
  bl clear_bit
  pop {r3, lr}
  bx lr

clear_column4:
  push {r1, r3, lr}
  add r1, r1, 0x00000300
  ldr r3, =#5
  bl clear_bit
  pop {r1, r3, lr}
  bx lr

clear_column5:
  push {r3, lr}
  ldr r3, =#30
  bl clear_bit
  pop {r3, lr}
  bx lr

@ Clear Rows
clear_row1:
  push {r3, lr}
  ldr r3, =#21
  bl clear_bit
  pop {r3, lr}
  bx lr
  
clear_row2:
  push {r3, lr}
  ldr r3, =#22
  bl clear_bit
  pop {r3, lr}
  bx lr
  
clear_row3:
  push {r3, lr}
  ldr r3, =#15
  bl clear_bit
  pop {r3, lr}
  bx lr
  
clear_row4:
  push {r3, lr}
  ldr r3, =#24
  bl clear_bit
  pop {r3, lr}
  bx lr

clear_row5:
  push {r3, lr}
  ldr r3, =#19
  bl clear_bit
  pop {r3, lr}
  bx lr

@ Turn off the light
turn_off_row1:
  push {r2, r3, lr}
  ldr r2, =0x504
  ldr r3, =#21
  bl clear_bit
  pop {r2, r3, lr}
  bx lr

turn_off_row2:
  push {r2, r3, lr}
  ldr r2, =0x504
  ldr r3, =#22
  bl clear_bit
  pop {r2, r3, lr}
  bx lr

turn_off_row3:
  push {r2, r3, lr}
  ldr r2, =0x504
  ldr r3, =#15
  bl clear_bit
  pop {r2, r3, lr}
  bx lr

turn_off_row4:
  push {r2, r3, lr}
  ldr r2, =0x504
  ldr r3, =#24
  bl clear_bit
  pop {r2, r3, lr}
  bx lr

turn_off_row5:
  push {r2, r3, lr}
  ldr r2, =0x504
  ldr r3, =#19
  bl clear_bit
  pop {r2, r3, lr}
  bx lr

.type main, %function
main:
  ldr r1, =0x50000000
  ldr r2, =0x514

  @ save the memory
  push {r5, r6, r7, r8, r9, r10, lr}
  @ initial setting
  ldr r9, =0x1000000
  ldr r8, =0x5
@ SHOW:
@ letter S
loop1:
  ldr r10, =0xffff
  ldr r7, =0x5
  ldr r5, =0x5
  ldr r6, =0x5
  cmp r8, 0
  beq loop2
  cmp r9, 0
  beq loop3
  bl set_row1
  bl set_row3
  bl set_row5
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_column5
  bl turn_on_row1
  bl turn_on_row3
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row3
  bl turn_off_row5
  bl clear_row1
  bl clear_row3
  bl clear_row5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_column5
  subs r8, 1
  subs r9, 0x80
  b loop1

loop2:
  ldr r10, =0xffff
  ldr r8, =0x5
  ldr r5, =0x5
  ldr r6, =0x5
  cmp r7, 0
  beq loop1
  cmp r9, 0
  beq loop3
  bl set_row2
  bl set_column1
  bl turn_on_row2
  bl set_row4
  bl turn_off_row2
  bl clear_column1
  bl set_column5
  bl turn_on_row4
  bl clear_row2
  bl turn_off_row4
  bl clear_row4
  bl clear_column5
  subs r7, 1
  subs r9, 0x80
  b loop2

@ From S to H
loop3:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop4
  cmp r10, 0
  beq loop5
  bl set_row1
  bl set_row3
  bl set_row5
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl turn_on_row1
  bl turn_on_row3
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row3
  bl turn_off_row5
  bl clear_row1
  bl clear_row3
  bl clear_row5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  subs r5, 1
  subs r10, 3
  b loop3

loop4:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop3
  cmp r10, 0
  beq loop5
  bl set_row4
  bl set_column4
  bl turn_on_row4
  bl turn_off_row4
  bl clear_column4
  bl clear_row4
  subs r6, 1
  subs r10, 3
  b loop4

loop5:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop6
  cmp r9, 0
  beq loop7
  bl set_row1
  bl set_row3
  bl set_row5
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column5
  bl turn_on_row1
  bl turn_on_row3
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row3
  bl turn_off_row5
  bl clear_row1
  bl clear_row3
  bl clear_row5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column5
  subs r8, 1
  subs r9, 3
  b loop5

loop6:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop5
  cmp r9, 0
  beq loop7
  bl set_row2
  bl set_column5
  bl turn_on_row2
  bl set_row4
  bl turn_off_row2
  bl set_column3
  bl turn_on_row4
  bl clear_row2
  bl turn_off_row4
  bl clear_row4
  bl clear_column3
  bl clear_column5
  subs r7, 1
  subs r9, 3
  b loop6

loop7:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop8
  cmp r10, 0
  beq loop9
  bl set_row1
  bl set_row3
  bl set_row5
  bl set_column1
  bl set_column2
  bl set_column4
  bl turn_on_row1
  bl turn_on_row3
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row5
  bl set_column5
  bl clear_row1
  bl clear_row5
  bl clear_row3
  bl turn_off_row3
  bl clear_column1
  bl clear_column2
  bl clear_column4
  bl clear_column5
  subs r5, 1
  subs r10, 3
  b loop7

loop8:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop7
  cmp r10, 0
  beq loop9
  bl set_row2
  bl set_row4
  bl set_column2
  bl set_column4
  bl turn_on_row4
  bl clear_column2
  bl turn_on_row2
  bl turn_off_row4
  bl turn_off_row2
  bl clear_row4
  bl clear_row2
  bl clear_column4
  subs r6, 1
  subs r10, 3
  b loop8

loop9:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop10
  cmp r9, 0
  beq loop11
  bl set_row1
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column1
  bl set_column3
  bl turn_on_row1
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_row1
  bl clear_row3
  bl clear_row4
  bl clear_row5
  bl clear_column1
  bl clear_column3
  subs r8, 1
  subs r9, 3
  b loop9

loop10:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop9
  cmp r9, 0
  beq loop11
  bl set_row3
  bl set_column4
  bl set_column5
  bl turn_on_row3
  bl set_row2
  bl set_column3
  bl clear_column4
  bl clear_column5
  bl turn_on_row2
  bl turn_off_row3
  bl clear_row3
  bl turn_off_row2
  bl clear_row2
  bl clear_column3
  subs r7, 1
  subs r9, 3
  b loop10

loop11:
  ldr r9, =0x1000000
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop12
  cmp r10, 0
  beq loop13
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column2
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column2
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r5, 1
  subs r10, 3
  b loop11

loop12:
  ldr r9, =0x1000000
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop11
  cmp r10, 0
  beq loop13
  bl set_column3
  bl set_column4
  bl set_column5
  bl set_row3
  bl turn_on_row3
  bl turn_off_row3
  bl clear_row3
  bl clear_column3
  bl clear_column4
  bl clear_column5
  subs r6, 1
  subs r10, 3
  b loop12

@ Letter H
loop13:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop14
  cmp r9, 0
  beq loop15
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column1
  bl set_column5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column1
  bl clear_column5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r8, 1
  subs r9, 0x80
  b loop13

loop14:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop13
  cmp r9, 0
  beq loop15
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_row3
  bl turn_on_row3
  bl turn_off_row3
  bl clear_row3
  bl clear_column2
  bl clear_column3
  bl clear_column4
  subs r7, 1
  subs r9, 0x80
  b loop14

@ From H to O
loop15:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop16
  cmp r10, 0
  beq loop17
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column4
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column4
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r6, 1
  subs r10, 3
  b loop15

loop16:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop15
  cmp r10, 0
  beq loop17
  bl set_row3
  bl set_column1
  bl set_column2
  bl set_column3
  bl turn_on_row3
  bl turn_off_row3
  bl clear_row3
  bl clear_column1
  bl clear_column2
  bl clear_column3
  subs r5, 1
  subs r10, 3
  b loop16

loop17:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop18
  cmp r9, 0
  beq loop19
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column3
  bl set_column5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column3
  bl clear_column5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r8, 1
  subs r9, 3
  b loop17

loop18:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop17
  cmp r9, 0
  beq loop19
  bl set_row3
  bl set_column1
  bl set_column2
  bl turn_on_row3
  bl turn_off_row3
  bl clear_row3
  bl clear_column1
  bl clear_column2
  subs r7, 1
  subs r9, 3
  b loop18

loop19:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop20
  cmp r10, 0
  beq loop21
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column2
  bl set_column4
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column2
  bl clear_column4
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r5, 1
  subs r10, 3
  b loop19

loop20:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop19
  cmp r10, 0
  beq loop21
  bl set_row1
  bl set_row5
  bl set_column5
  bl turn_on_row1
  bl turn_on_row5
  bl set_row3
  bl turn_off_row1
  bl turn_off_row5
  bl clear_column5
  bl set_column1
  bl turn_on_row3
  bl clear_row1
  bl clear_row5
  bl turn_off_row3
  bl clear_row3
  bl clear_column1
  subs r6, 1
  subs r10, 3
  b loop20

loop21:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop22
  cmp r9, 0
  beq loop23
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column1
  bl set_column3
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column1
  bl clear_column3
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r7, 1
  subs r9, 3
  b loop21

loop22:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop21
  cmp r9, 0
  beq loop23
  bl set_row1
  bl set_row5
  bl set_column4
  bl set_column5
  bl turn_on_row1
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row5
  bl clear_column4
  bl clear_column5
  bl clear_row1
  bl clear_row5
  subs r8, 1
  subs r9, 3
  b loop22

loop23:
  ldr r9, =0x1000000
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop24
  cmp r10, 0
  beq loop25
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column2
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column2
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r6, 1
  subs r10, 3
  b loop23

loop24:
  ldr r9, =0x1000000
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop23
  cmp r10, 0
  beq loop25
  bl set_row1
  bl set_row5
  bl set_column3
  bl set_column4
  bl set_column5
  bl turn_on_row1
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row5
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl clear_row1
  bl clear_row5
  subs r5, 1
  subs r10, 3
  b loop24

@ Letter O
loop25:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop26
  cmp r9, 0
  beq loop27
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column1
  bl set_column5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column1
  bl clear_column5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r8, 1
  subs r9, 0x80
  b loop25

loop26:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop25
  cmp r9, 0
  beq loop27
  bl set_row1
  bl set_row5
  bl set_column2
  bl set_column3
  bl set_column4
  bl turn_on_row1
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row5
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_row1
  bl clear_row5
  subs r7, 1
  subs r9, 0x80
  b loop26

@ From O to W
loop27:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop28
  cmp r10, 0
  beq loop29
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column4
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column4
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r5, 1
  subs r10, 3
  b loop27

loop28:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop28
  cmp r10, 0
  beq loop29
  bl set_row1
  bl set_row5
  bl set_column1
  bl set_column2
  bl set_column3
  bl turn_on_row1
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_row1
  bl clear_row5
  subs r6, 1
  subs r10, 3
  b loop27

loop29:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop30
  cmp r9, 0
  beq loop31
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column3
  bl set_column5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column3
  bl clear_column5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r8, 1
  subs r9, 3
  b loop29

loop30:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop29
  cmp r9, 0
  beq loop31
  bl set_row1
  bl set_row5
  bl set_column1
  bl set_column2
  bl turn_on_row1
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row5
  bl clear_column1
  bl clear_column2
  bl clear_row1
  bl clear_row5
  subs r7, 1
  subs r9, 3
  b loop30

loop31:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop32
  cmp r10, 0
  beq loop33
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column2
  bl set_column4
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column2
  bl clear_column4
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r5, 1
  subs r10, 3
  b loop31

loop32:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop31
  cmp r10, 0
  beq loop33
  bl set_row1
  bl set_row5
  bl set_column1
  bl turn_on_row1
  bl turn_on_row5
  bl set_row4
  bl turn_off_row1
  bl turn_off_row5
  bl clear_column1
  bl set_column5
  bl turn_on_row4
  bl clear_row1
  bl clear_row5
  bl turn_off_row4
  bl clear_column5
  bl clear_row4
  subs r6, 1
  subs r10, 3
  b loop32

loop33:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop34
  cmp r9, 0
  beq loop35
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column1
  bl set_column3
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column1
  bl clear_column3
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r8, 1
  subs r9, 3
  b loop33

loop34:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop33
  cmp r9, 0
  beq loop35
  bl set_row3
  bl set_column5
  bl turn_on_row3
  bl turn_off_row3
  bl clear_column4
  bl clear_row3
  bl set_column5
  bl set_row4
  bl turn_on_row4
  bl turn_off_row4
  bl clear_row4
  bl clear_column4
  subs r7, 1
  subs r9, 3
  b loop34

loop35:
  ldr r9, =0x1000000
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop36
  cmp r10, 0
  beq loop37
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column2
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column2
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r5, 1
  subs r10, 3
  b loop35

loop36:
  ldr r9, =0x1000000
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop35
  cmp r10, 0
  beq loop37
  bl set_column4
  bl set_row3
  bl turn_on_row3
  bl turn_off_row3
  bl clear_row3
  bl clear_column4
  bl set_row4
  bl set_column3
  bl set_column5
  bl turn_on_row4
  bl turn_off_row4
  bl clear_row4
  bl clear_column3
  bl clear_column5
  subs r6, 1
  subs r10, 3
  b loop36

@ Letter W
loop37:
  ldr r10, =0xa00000
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop38
  cmp r9, 0
  beq blank_loop1
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column1
  bl set_column5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column1
  bl clear_column5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r8, 1
  subs r9, 0x80
  b loop37

loop38:
  ldr r10, =0xa00000
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop37
  cmp r9, 0
  beq blank_loop1
  bl set_row3
  bl set_column3
  bl turn_on_row3
  bl set_row4
  bl turn_off_row3
  bl clear_column3
  bl set_column2
  bl set_column4
  bl turn_on_row4
  bl clear_row3
  bl turn_off_row4
  bl clear_row4
  bl clear_column2
  bl clear_column4
  subs r7, 1
  subs r9, 0x80
  b loop38

blank_loop1:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  ldr r5, =0x5
  cmp r10, 0
  beq loop39
  subs r10, 0x10
  b blank_loop1

@ TIME:
@ Letter T
loop39:
  ldr r10, =0xa00000
  ldr r6, =0x5
  cmp r5, 0
  beq loop40
  cmp r9, 0
  beq blank_loop2
  bl set_row1
  bl turn_on_row1
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row1
  bl clear_row1
  subs r5, 1
  subs r9, 1
  b loop39

loop40:
  ldr r10, =0xa00000
  ldr r5, =0x5
  cmp r6, 0
  beq loop39
  cmp r9, 0
  beq blank_loop2
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column3
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column3
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r6, 1
  subs r9, 1
  b loop40

blank_loop2:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  ldr r5, =0x5
  cmp r10, 0
  beq loop41
  subs r10, 0x10
  b blank_loop2

@ Letter I
loop41:
  ldr r10, =0xa00000
  ldr r7, =0x5
  cmp r8, 0
  beq loop42
  cmp r9, 0
  beq blank_loop3
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_column3
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl clear_column3
  bl clear_row2
  bl clear_row3
  bl clear_row4
  subs r8, 1
  subs r9, 1
  b loop41

loop42:
  ldr r10, =0xa00000
  ldr r8, =0x5
  cmp r7, 0
  beq loop41
  cmp r9, 0
  beq blank_loop3
  bl set_row1
  bl set_row5
  bl turn_on_row1
  bl turn_on_row5
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row1
  bl turn_off_row5
  bl clear_row1
  bl clear_row5
  subs r7, 1
  subs r9, 1
  b loop42

blank_loop3:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  ldr r5, =0x5
  cmp r10, 0
  beq loop43
  subs r10, 0x10
  b blank_loop3

@ Letter M
loop43:
  ldr r10, =0xa00000
  ldr r5, =0x5
  cmp r6, 0
  beq loop44
  cmp r9, 0
  beq blank_loop4
  bl set_column1
  bl set_column5
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column1
  bl clear_column5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r6, 1
  subs r9, 1
  b loop43

loop44:
  ldr r10, =0xa00000
  ldr r6, =0x5
  cmp r5, 0
  beq loop43
  cmp r9, 0
  beq blank_loop4
  bl set_row2
  bl set_column2
  bl set_column4
  bl turn_on_row2
  bl set_row3
  bl turn_off_row2
  bl clear_column2
  bl clear_column4
  bl set_column3
  bl turn_on_row3
  bl clear_row2
  bl turn_off_row3
  bl clear_column3
  bl clear_row3
  subs r5, 1
  subs r9, 1
  b loop44

blank_loop4:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  ldr r5, =0x5
  cmp r10, 0
  beq loop45
  subs r10, 0x10
  b blank_loop4

@ Letter E
loop45:
  ldr r10, =0xa00000
  ldr r6, =0x5
  cmp r5, 0
  beq loop46
  cmp r9, 0
  beq blank_loop5
  bl set_row1
  bl set_row3
  bl set_row5
  bl turn_on_row1
  bl turn_on_row3
  bl turn_on_row5
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row1
  bl turn_off_row3
  bl turn_off_row5
  bl clear_row1
  bl clear_row3
  bl clear_row5
  subs r5, 1
  subs r9, 1
  b loop45

loop46:
  ldr r10, =0xa00000
  ldr r5, =0x5
  cmp r6, 0
  beq loop45
  cmp r9, 0
  beq blank_loop5
  bl set_row2
  bl set_row4
  bl set_column1
  bl turn_on_row2
  bl turn_on_row4
  bl turn_off_row2
  bl turn_off_row4
  bl clear_column1
  bl clear_row2
  bl clear_row4
  subs r6, 1
  subs r9, 1
  b loop46

blank_loop5:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  ldr r5, =0x5
  cmp r10, 0
  beq loop47
  subs r10, 0x10
  b blank_loop5

@ Arrow (Left to Right)
loop47:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop48
  cmp r9, 0
  beq loop49
  bl set_row2
  bl turn_on_row2
  bl set_column1
  bl set_column2
  bl set_column3
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl turn_off_row2
  bl clear_row2
  subs r8, 1
  subs r9, 3
  b loop47

loop48:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop47
  cmp r9, 0
  beq loop49
  bl set_row1
  bl set_row3
  bl set_column2
  bl turn_on_row1
  bl turn_on_row3
  bl turn_off_row1
  bl turn_off_row3
  bl clear_column2
  bl clear_row1
  bl clear_row3
  subs r7, 1
  subs r9, 3
  b loop48

loop49:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop50
  cmp r10, 0
  beq loop51
  bl set_row2
  bl turn_on_row2
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl turn_off_row2
  bl clear_row2
  subs r5, 1
  subs r10, 3
  b loop49

loop50:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop49
  cmp r10, 0
  beq loop51
  bl set_row1
  bl set_row3
  bl set_column3
  bl turn_on_row1
  bl turn_on_row3
  bl turn_off_row1
  bl turn_off_row3
  bl clear_column2
  bl clear_row1
  bl clear_row3
  subs r6, 1
  subs r10, 3
  b loop50

loop51:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop52
  cmp r9, 0
  beq loop53
  bl set_row2
  bl turn_on_row2
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row2
  bl clear_row2
  subs r8, 1
  subs r9, 3
  b loop51

loop52:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop51
  cmp r9, 0
  beq loop53
  bl set_row1
  bl set_row3
  bl set_column4
  bl turn_on_row1
  bl turn_on_row3
  bl turn_off_row1
  bl turn_off_row3
  bl clear_column4
  bl clear_row1
  bl clear_row3
  subs r7, 1
  subs r9, 3
  b loop52

@ Arrow (Right to Left)
loop53:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop54
  cmp r10, 0
  beq loop55
  bl set_row4
  bl turn_on_row4
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row4
  bl clear_row4
  subs r5, 1
  subs r10, 3
  b loop53

loop54:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop53
  cmp r10, 0
  beq loop55
  bl set_row3
  bl set_row5
  bl set_column4
  bl turn_on_row3
  bl turn_on_row5
  bl turn_off_row3
  bl turn_off_row5
  bl clear_column4
  bl clear_row3
  bl clear_row5
  subs r6, 1
  subs r10, 3
  b loop54

loop55:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop56
  cmp r9, 0
  beq loop57
  bl set_row4
  bl turn_on_row4
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row4
  bl clear_row4
  subs r8, 1
  subs r9, 3
  b loop55

loop56:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop55
  cmp r9, 0
  beq loop57
  bl set_row3
  bl set_row5
  bl set_column3
  bl turn_on_row3
  bl turn_on_row5
  bl turn_off_row3
  bl turn_off_row5
  bl clear_column3
  bl clear_row3
  bl clear_row5
  subs r7, 1
  subs r9, 3
  b loop56

loop57:
  ldr r9, =0xffff
  ldr r8, =0x4
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop58
  cmp r10, 0
  beq loop59
  bl set_row4
  bl turn_on_row4
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row4
  bl clear_row4
  subs r5, 1
  subs r10, 3
  b loop57

loop58:
  ldr r9, =0xffff
  ldr r8, =0x4
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop57
  cmp r10, 0
  beq loop59
  bl set_row3
  bl set_row5
  bl set_column2
  bl turn_on_row3
  bl turn_on_row5
  bl turn_off_row3
  bl turn_off_row5
  bl clear_column2
  bl clear_row3
  bl clear_row5
  subs r6, 1
  subs r10, 3
  b loop58

@ Changing Picture
loop59:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq arrow1
  cmp r9, 0
  beq loop60
  bl set_row3
  bl turn_on_row3
  bl set_column3
  bl turn_off_row3
  bl clear_column3
  bl clear_row3
  subs r9, 1
  b loop59

loop60:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r10, 0
  beq loop61
  bl set_row2
  bl set_row3
  bl set_row4
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl set_column2
  bl set_column3
  bl set_column4
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl clear_row2
  bl clear_row3
  bl clear_row4
  subs r10, 5
  b loop60

loop61:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r9, 0
  beq loop62
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row4
  bl turn_on_row5
  bl set_column1
  bl set_column2
  bl set_column4
  bl set_column5
  bl clear_column1
  bl clear_column2
  bl clear_column4
  bl clear_column5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row4
  bl turn_off_row5
  bl turn_on_row3
  bl set_column3
  bl clear_row1
  bl clear_row2
  bl clear_row4
  bl clear_row5
  bl clear_column3
  bl turn_off_row3
  bl clear_row3
  subs r9, 5
  b loop61

loop62:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r10, 0
  beq loop63
  bl set_row1
  bl set_row2
  bl set_row4
  bl set_row5
  bl turn_on_row2
  bl turn_on_row4
  bl set_column2
  bl set_column4
  bl clear_column2
  bl clear_column4
  bl turn_off_row2
  bl turn_off_row4
  bl turn_on_row1
  bl turn_on_row5
  bl set_column1
  bl set_column5
  bl clear_row2
  bl clear_row4
  bl clear_column1
  bl clear_column5
  bl turn_off_row1
  bl turn_off_row5
  bl clear_row1
  bl clear_row5
  subs r10, 5
  b loop62

loop63:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r9, 0
  beq loop64
  bl set_row1
  bl set_row5
  bl turn_on_row1
  bl turn_on_row5
  bl set_column1
  bl set_column5
  bl clear_column1
  bl clear_column5
  bl turn_off_row1
  bl turn_off_row5
  bl clear_row1
  bl clear_row5
  subs r9, 5
  b loop63

@ Repeat Picture
loop64:
  ldr r10, =0xffff
  ldr r9, =0xffff
  ldr r5, =0x4
  ldr r7, =0x5
  ldr r6, =0x5
  subs r8, 1
  b loop59

@ Arrow (Bottom to Top)
arrow1:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq arrow2
  cmp r9, 0
  beq arrow3
  bl set_row4
  bl turn_on_row4
  bl set_column1
  bl set_column2
  bl set_column3
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl turn_off_row4
  bl clear_row4
  subs r8, 1
  subs r9, 3
  b arrow1

arrow2:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq arrow1
  cmp r9, 0
  beq arrow3
  bl set_column2
  bl set_row3
  bl set_row4
  bl set_row5
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_row3
  bl clear_row4
  bl clear_row5
  bl clear_column2
  subs r7, 1
  subs r9, 3
  b arrow2

arrow3:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq arrow4
  cmp r10, 0
  beq arrow5
  bl set_row3
  bl turn_on_row3
  bl set_column1
  bl set_column2
  bl set_column3
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl turn_off_row3
  bl clear_row3
  subs r5, 1
  subs r10, 3
  b arrow3

arrow4:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq arrow3
  cmp r10, 0
  beq arrow5
  bl set_column2
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  bl clear_column2
  subs r6, 1
  subs r10, 3
  b arrow4

arrow5:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq arrow6
  cmp r9, 0
  beq arrow7
  bl set_row2
  bl turn_on_row2
  bl set_column1
  bl set_column2
  bl set_column3
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl turn_off_row2
  bl clear_row2
  subs r8, 1
  subs r9, 3
  b arrow5

arrow6:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq arrow5
  cmp r9, 0
  beq arrow7
  bl set_row1
  bl set_row3
  bl set_column2
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  bl clear_column2
  subs r7, 1
  subs r9, 3
  b arrow6

@ Arrow (Top to Bottom)
arrow7:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq arrow8
  cmp r10, 0
  beq arrow9
  bl set_row2
  bl turn_on_row2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row2
  bl clear_row2
  subs r8, 1
  subs r10, 3
  b arrow7

arrow8:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq arrow7
  cmp r10, 0
  beq arrow9
  bl set_column4
  bl set_row1
  bl set_row2
  bl set_row3
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_column4
  subs r7, 1
  subs r10, 3
  b arrow8

arrow9:
  ldr r10, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq arrow10
  cmp r9, 0
  beq arrow11
  bl set_row3
  bl turn_on_row3
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row3
  bl clear_row3
  subs r5, 1
  subs r9, 3
  b arrow9

arrow10:
  ldr r10, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq arrow9
  cmp r9, 0
  beq arrow11
  bl set_column4
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_column4
  subs r6, 1
  subs r9, 3
  b arrow10

arrow11:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq arrow12
  cmp r10, 0
  beq out1
  bl set_row4
  bl turn_on_row4
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row4
  bl clear_row4
  subs r8, 1
  subs r10, 3
  b arrow11

arrow12:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq arrow11
  cmp r10, 0
  beq out1
  bl set_row1
  bl set_row3
  bl set_column4
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  bl clear_column4
  subs r7, 1
  subs r10, 3
  b arrow12

@ Exit the arrows
out1:
  ldr r10, =0xffff
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  ldr r5, =0x5
  b loop77

@ Rhombus
loop77:
  ldr r9, =0xffff
  ldr r6, =0x5
  ldr r5, =0x5
  ldr r7, =0x5
  cmp r10, 0
  beq loop78
  cmp r8, 0
  beq arrow13
  bl set_row3
  bl set_column3
  bl turn_on_row3
  bl turn_off_row3
  bl clear_column3
  bl clear_row3
  subs r10, 1
  b loop77

loop78:
  ldr r10, =0xffff
  ldr r6, =0x5
  ldr r5, =0x5
  cmp r9, 0
  beq loop80
  cmp r7, 0
  beq loop79
  bl set_column3
  bl set_row2
  bl set_row4
  bl turn_on_row2
  bl turn_on_row4
  bl turn_off_row2
  bl turn_off_row4
  bl clear_column3
  bl clear_row2
  bl clear_row4
  subs r7, 1
  subs r9, 3
  b loop78

loop79:
  ldr r10, =0xffff
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r9, 0
  beq loop80
  cmp r5, 0
  beq loop78
  bl set_row3
  bl turn_on_row3
  bl set_column2
  bl set_column4
  bl clear_column2
  bl clear_column4
  bl turn_off_row3
  bl clear_row3
  subs r5, 1
  subs r9, 3
  b loop78

loop80:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r7, =0x5
  cmp r6, 0
  beq loop81
  cmp r10, 0
  beq loop82
  bl set_row2
  bl set_row4
  bl turn_on_row2
  bl turn_on_row4
  bl set_column2
  bl set_column3
  bl set_column4
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl turn_off_row2
  bl turn_off_row4
  bl clear_row2
  bl clear_row4
  subs r6, 1
  subs r10, 3
  b loop80

loop81:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  cmp r7, 0
  beq loop80
  cmp r10, 0
  beq loop82
  bl set_row3
  bl turn_on_row3
  bl set_column2
  bl set_column4
  bl clear_column2
  bl clear_column4
  bl turn_off_row3
  bl clear_row3
  subs r7, 1
  subs r10, 3
  b loop81

loop82:
  ldr r10, =0xffff
  ldr r6, =0x5
  ldr r5, =0x5
  cmp r9, 0
  beq loop84
  cmp r7, 0
  beq loop83
  bl set_row3
  bl turn_on_row3
  bl set_column1
  bl set_column5
  bl clear_column1
  bl clear_column5
  bl turn_off_row3
  bl clear_row3
  bl set_row1
  bl set_row5
  bl turn_on_row1
  bl turn_on_row5
  bl set_column3
  bl turn_off_row1
  bl turn_off_row5
  bl clear_column3
  bl clear_row1
  bl clear_row5
  subs r7, 1
  subs r9, 3
  b loop82

loop83:
  ldr r10, =0xffff
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r9, 0
  beq loop84
  cmp r5, 0
  beq loop82
  bl set_row2
  bl set_row4
  bl turn_on_row2
  bl turn_on_row4
  bl set_column2
  bl set_column4
  bl clear_column2
  bl clear_column4
  bl turn_off_row2
  bl turn_off_row4
  bl clear_row2
  bl clear_row4
  subs r5, 1
  subs r9, 3
  b loop83

loop84:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  cmp r7, 0
  beq loop85
  cmp r10, 0
  beq loop86
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column1
  bl set_column5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column1
  bl clear_column5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r7, 1
  subs r10, 3
  b loop84

loop85:
  ldr r9, =0xffff
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r5, 0
  beq loop84
  cmp r10, 0
  beq loop86
  bl set_row1
  bl set_row5
  bl set_column2
  bl set_column3
  bl set_column4
  bl turn_on_row1
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row5
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_row1
  bl clear_row5
  subs r5, 1
  subs r10, 3
  b loop85

@ Repeat Rhombus
loop86:
  ldr r10, =0xffff
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  subs r8, 1
  b loop77

@ Arrow (Top to Bottom)
arrow13:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq arrow14
  cmp r10, 0
  beq arrow15
  bl set_row2
  bl turn_on_row2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row2
  bl clear_row2
  subs r8, 1
  subs r10, 3
  b arrow13

arrow14:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq arrow13
  cmp r10, 0
  beq arrow15
  bl set_column4
  bl set_row1
  bl set_row2
  bl set_row3
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_column4
  subs r7, 1
  subs r10, 3
  b arrow14

arrow15:
  ldr r10, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq arrow16
  cmp r9, 0
  beq arrow17
  bl set_row3
  bl turn_on_row3
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row3
  bl clear_row3
  subs r5, 1
  subs r9, 3
  b arrow15

arrow16:
  ldr r10, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq arrow15
  cmp r9, 0
  beq arrow17
  bl set_column4
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_column4
  subs r6, 1
  subs r9, 3
  b arrow16

arrow17:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq arrow18
  cmp r10, 0
  beq arrow19
  bl set_row4
  bl turn_on_row4
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row4
  bl clear_row4
  subs r8, 1
  subs r10, 3
  b arrow17

arrow18:
  ldr r9, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq arrow17
  cmp r10, 0
  beq arrow19
  bl set_row1
  bl set_row3
  bl set_column4
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  bl clear_column4
  subs r7, 1
  subs r10, 3
  b arrow18

@ Arrow (Bottom to Top)
arrow19:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq arrow20
  cmp r9, 0
  beq arrow21
  bl set_row4
  bl turn_on_row4
  bl set_column1
  bl set_column2
  bl set_column3
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl turn_off_row4
  bl clear_row4
  subs r8, 1
  subs r9, 3
  b arrow19

arrow20:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq arrow19
  cmp r9, 0
  beq arrow21
  bl set_column2
  bl set_row3
  bl set_row4
  bl set_row5
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_row3
  bl clear_row4
  bl clear_row5
  bl clear_column2
  subs r7, 1
  subs r9, 3
  b arrow20

arrow21:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq arrow22
  cmp r10, 0
  beq arrow23
  bl set_row3
  bl turn_on_row3
  bl set_column1
  bl set_column2
  bl set_column3
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl turn_off_row3
  bl clear_row3
  subs r5, 1
  subs r10, 3
  b arrow21

arrow22:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq arrow21
  cmp r10, 0
  beq arrow23
  bl set_column2
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  bl clear_column2
  subs r6, 1
  subs r10, 3
  b arrow22

arrow23:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq arrow24
  cmp r9, 0
  beq out2
  bl set_row2
  bl turn_on_row2
  bl set_column1
  bl set_column2
  bl set_column3
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl turn_off_row2
  bl clear_row2
  subs r8, 1
  subs r9, 3
  b arrow23

arrow24:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq arrow23
  cmp r9, 0
  beq out2
  bl set_row1
  bl set_row3
  bl set_column2
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  bl clear_column2
  subs r7, 1
  subs r9, 3
  b arrow24

@ Exit the arrows
out2:
  ldr r10, =0xffff
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  ldr r5, =0x3
  b cross5

@ Cross
cross1:
  ldr r9, =0xffff
  ldr r7, =0x5
  cmp r8, 0
  beq cross2
  cmp r10, 0
  beq cross13
  bl set_column3
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  bl clear_column3
  subs r8, 1
  subs r10, 3
  b cross1

cross2:
  ldr r9, =0xffff
  ldr r8, =0x5
  cmp r7, 0
  beq cross1
  cmp r10, 0
  beq cross13
  bl set_row3
  bl turn_on_row3
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row3
  bl clear_row3
  subs r7, 1
  subs r10, 3
  b cross2

cross3:
  ldr r10, =0xffff
  ldr r8, =0x5
  cmp r7, 0
  beq cross4
  cmp r9, 0
  beq cross1
  bl set_column3
  bl set_row1
  bl set_row2
  bl set_row4
  bl set_row5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row4
  bl turn_off_row5
  bl clear_row1
  bl clear_row2
  bl clear_row4
  bl clear_row5
  bl clear_column3
  subs r7, 1
  subs r9, 3
  b cross3

cross4:
  ldr r10, =0xffff
  ldr r7, =0x5
  cmp r8, 0
  beq cross3
  cmp r9, 0
  beq cross1
  bl set_row3
  bl turn_on_row3
  bl set_column1
  bl set_column2
  bl set_column4
  bl set_column5
  bl clear_column1
  bl clear_column2
  bl clear_column4
  bl clear_column5
  bl turn_off_row3
  bl clear_row3
  subs r8, 1
  subs r9, 3
  b cross4

cross5:
  ldr r9, =0xffff
  ldr r7, =0x5
  cmp r5, 0
  beq loop65
  cmp r8, 0
  beq cross6
  cmp r10, 0
  beq cross4
  bl set_column3
  bl set_row1
  bl set_row5
  bl turn_on_row1
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row5
  bl clear_row1
  bl clear_row5
  bl clear_column3
  subs r8, 1
  subs r10, 3
  b cross5

cross6:
  ldr r9, =0xffff
  ldr r8, =0x5
  cmp r7, 0
  beq cross5
  cmp r10, 0
  beq cross4
  bl set_row3
  bl turn_on_row3
  bl set_column1
  bl set_column5
  bl clear_column1
  bl clear_column5
  bl turn_off_row3
  bl clear_row3
  subs r7, 1
  subs r10, 3
  b cross6

cross13:
  ldr r10, =0xffff
  ldr r8, =0x5
  cmp r7, 0
  beq cross14
  cmp r9, 0
  beq cross15
  bl set_column3
  bl set_row2
  bl set_row3
  bl set_row4
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_column3
  subs r7, 1
  subs r9, 3
  b cross13

cross14:
  ldr r10, =0xffff
  ldr r7, =0x5
  cmp r8, 0
  beq cross13
  cmp r9, 0
  beq cross15
  bl set_row3
  bl turn_on_row3
  bl set_column2
  bl set_column3
  bl set_column4
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl turn_off_row3
  bl clear_row3
  subs r8, 1
  subs r9, 3
  b cross14

cross15:
  ldr r9, =0xffff
  ldr r7, =0x5
  cmp r10, 0
  beq cross7
  bl set_row3
  bl set_column3
  bl turn_on_row3
  bl turn_off_row3
  bl clear_column3
  bl clear_row3
  subs r10, 1
  b cross15

@ Another cross
cross7:
  ldr r10, =0xffff
  ldr r7, =0x5
  cmp r8, 0
  beq cross8
  cmp r9, 0
  beq cross9
  bl set_row3
  bl turn_on_row3
  bl set_column3
  bl clear_column3
  bl turn_off_row3
  bl clear_row3
  bl set_row2
  bl turn_on_row2
  bl set_column2
  bl set_column4
  bl clear_column2
  bl clear_column4
  bl turn_off_row2
  bl clear_row2
  subs r8, 1
  subs r9, 3
  b cross7

cross8:
  ldr r10, =0xffff
  ldr r8, =0x5
  cmp r7, 0
  beq cross7
  cmp r9, 0
  beq cross9
  bl set_row3
  bl turn_on_row3
  bl set_column3
  bl clear_column3
  bl turn_off_row3
  bl clear_row3
  bl set_row4
  bl turn_on_row4
  bl set_column2
  bl set_column4
  bl clear_column2
  bl clear_column4
  bl turn_off_row4
  bl clear_row4
  subs r7, 1
  subs r9, 3
  b cross8

cross9:
  ldr r9, =0xffff
  ldr r8, =0x5
  cmp r7, 0
  beq cross10
  cmp r10, 0
  beq cross11
  bl set_row3
  bl turn_on_row3
  bl set_column3
  bl clear_column3
  bl turn_off_row3
  bl clear_row3
  bl set_row2
  bl turn_on_row2
  bl set_column2
  bl set_column4
  bl clear_column2
  bl clear_column4
  bl turn_off_row2
  bl clear_row2
  bl set_row1
  bl turn_on_row1
  bl set_column1
  bl set_column5
  bl clear_column1
  bl clear_column5
  bl turn_off_row1
  bl clear_row1
  subs r7, 1
  subs r10, 3
  b cross9

cross10:
  ldr r9, =0xffff
  ldr r7, =0x5
  cmp r8, 0
  beq cross9
  cmp r10, 0
  beq cross11
  bl set_row3
  bl turn_on_row3
  bl set_column3
  bl clear_column3
  bl turn_off_row3
  bl clear_row3
  bl set_row4
  bl turn_on_row4
  bl set_column2
  bl set_column4
  bl clear_column2
  bl clear_column4
  bl turn_off_row4
  bl clear_row4
  bl set_row5
  bl turn_on_row5
  bl set_column1
  bl set_column5
  bl clear_column1
  bl clear_column5
  bl turn_off_row5
  bl clear_row5
  subs r8, 1
  subs r10, 3
  b cross10

cross11:
  ldr r10, =0xffff
  ldr r7, =0x5
  cmp r8, 0
  beq cross12
  cmp r9, 0
  beq cross16
  bl set_row2
  bl turn_on_row2
  bl set_column2
  bl set_column4
  bl clear_column2
  bl clear_column4
  bl turn_off_row2
  bl clear_row2
  bl set_row1
  bl turn_on_row1
  bl set_column1
  bl set_column5
  bl clear_column1
  bl clear_column5
  bl turn_off_row1
  bl clear_row1
  subs r8, 1
  subs r9, 3
  b cross11

cross12:
  ldr r10, =0xffff
  ldr r8, =0x5
  cmp r7, 0
  beq cross11
  cmp r9, 0
  beq cross16
  bl set_row4
  bl turn_on_row4
  bl set_column2
  bl set_column4
  bl clear_column2
  bl clear_column4
  bl turn_off_row4
  bl clear_row4
  bl set_row5
  bl turn_on_row5
  bl set_column1
  bl set_column5
  bl clear_column1
  bl clear_column5
  bl turn_off_row5
  bl clear_row5
  subs r7, 1
  subs r9, 3
  b cross12

cross16:
  ldr r9, =0xa00000
  ldr r7, =0x5
  cmp r8, 0
  beq cross17
  cmp r10, 0
  beq out3
  bl set_row1
  bl turn_on_row1
  bl set_column1
  bl set_column5
  bl clear_column1
  bl clear_column5
  bl turn_off_row1
  bl clear_row1
  subs r8, 1
  subs r10, 1
  b cross16

cross17:
  ldr r9, =0xa00000
  ldr r8, =0x5
  cmp r7, 0
  beq cross16
  cmp r10, 0
  beq out3
  bl set_row5
  bl turn_on_row5
  bl set_column1
  bl set_column5
  bl clear_column1
  bl clear_column5
  bl turn_off_row5
  bl clear_row5
  subs r7, 1
  subs r10, 1
  b cross17

out3:
  ldr r10, =0xffff
  ldr r8, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r9, 0
  beq out4
  subs r9, 0x10
  b out3

out4:
  subs r5, 1
  b cross5

@ Arrow (Right to Left)
loop65:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop66
  cmp r10, 0
  beq loop67
  bl set_row4
  bl turn_on_row4
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row4
  bl clear_row4
  subs r5, 1
  subs r10, 3
  b loop65

loop66:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop65
  cmp r10, 0
  beq loop67
  bl set_row3
  bl set_row5
  bl set_column4
  bl turn_on_row3
  bl turn_on_row5
  bl turn_off_row3
  bl turn_off_row5
  bl clear_column4
  bl clear_row3
  bl clear_row5
  subs r6, 1
  subs r10, 3
  b loop66

loop67:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop68
  cmp r9, 0
  beq loop69
  bl set_row4
  bl turn_on_row4
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row4
  bl clear_row4
  subs r8, 1
  subs r9, 3
  b loop67

loop68:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop67
  cmp r9, 0
  beq loop69
  bl set_row3
  bl set_row5
  bl set_column3
  bl turn_on_row3
  bl turn_on_row5
  bl turn_off_row3
  bl turn_off_row5
  bl clear_column3
  bl clear_row3
  bl clear_row5
  subs r7, 1
  subs r9, 3
  b loop68

loop69:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop70
  cmp r10, 0
  beq loop71
  bl set_row4
  bl turn_on_row4
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row4
  bl clear_row4
  subs r5, 1
  subs r10, 3
  b loop69

loop70:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop69
  cmp r10, 0
  beq loop71
  bl set_row3
  bl set_row5
  bl set_column2
  bl turn_on_row3
  bl turn_on_row5
  bl turn_off_row3
  bl turn_off_row5
  bl clear_column2
  bl clear_row3
  bl clear_row5
  subs r6, 1
  subs r10, 3
  b loop70

@ Arrow (Left to Right)
loop71:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop72
  cmp r9, 0
  beq loop73
  bl set_row2
  bl turn_on_row2
  bl set_column1
  bl set_column2
  bl set_column3
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl turn_off_row2
  bl clear_row2
  subs r8, 1
  subs r9, 3
  b loop71

loop72:
  ldr r10, =0xffff
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop71
  cmp r9, 0
  beq loop73
  bl set_row1
  bl set_row3
  bl set_column2
  bl turn_on_row1
  bl turn_on_row3
  bl turn_off_row1
  bl turn_off_row3
  bl clear_column2
  bl clear_row1
  bl clear_row3
  subs r7, 1
  subs r9, 3
  b loop72

loop73:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r5, 0
  beq loop74
  cmp r10, 0
  beq loop75
  bl set_row2
  bl turn_on_row2
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl turn_off_row2
  bl clear_row2
  subs r5, 1
  subs r10, 3
  b loop73

loop74:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r5, =0x5
  cmp r6, 0
  beq loop73
  cmp r10, 0
  beq loop75
  bl set_row1
  bl set_row3
  bl set_column3
  bl turn_on_row1
  bl turn_on_row3
  bl turn_off_row1
  bl turn_off_row3
  bl clear_column2
  bl clear_row1
  bl clear_row3
  subs r6, 1
  subs r10, 3
  b loop74

loop75:
  ldr r10, =0xa00000
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r7, =0x5
  cmp r8, 0
  beq loop76
  cmp r9, 0
  beq blank_loop6
  bl set_row2
  bl turn_on_row2
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row2
  bl clear_row2
  subs r8, 1
  subs r9, 3
  b loop75

loop76:
  ldr r10, =0xa00000
  ldr r5, =0x5
  ldr r6, =0x5
  ldr r8, =0x5
  cmp r7, 0
  beq loop75
  cmp r9, 0
  beq blank_loop6
  bl set_row1
  bl set_row3
  bl set_column4
  bl turn_on_row1
  bl turn_on_row3
  bl turn_off_row1
  bl turn_off_row3
  bl clear_column4
  bl clear_row1
  bl clear_row3
  subs r7, 1
  subs r9, 3
  b loop76

blank_loop6:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  ldr r5, =0x5
  cmp r10, 0
  beq loop87
  subs r10, 0x10
  b blank_loop6

@ END
@ Letter E
loop87:
  ldr r10, =0xa00000
  ldr r6, =0x5
  cmp r5, 0
  beq loop88
  cmp r9, 0
  beq blank_loop7
  bl set_row2
  bl set_row4
  bl set_column1
  bl turn_on_row2
  bl turn_on_row4
  bl turn_off_row2
  bl turn_off_row4
  bl clear_column1
  bl clear_row2
  bl clear_row4
  subs r5, 1
  subs r9, 1
  b loop87

loop88:
  ldr r10, =0xa00000
  ldr r5, =0x5
  cmp r6, 0
  beq loop87
  cmp r9, 0
  beq blank_loop7
  bl set_row1
  bl set_row3
  bl set_row5
  bl turn_on_row1
  bl turn_on_row3
  bl turn_on_row5
  bl set_column1
  bl set_column2
  bl set_column3
  bl set_column4
  bl set_column5
  bl clear_column1
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_column5
  bl turn_off_row1
  bl turn_off_row3
  bl turn_off_row5
  bl clear_row1
  bl clear_row3
  bl clear_row5
  subs r6, 1
  subs r9, 1
  b loop88

blank_loop7:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  ldr r5, =0x5
  cmp r10, 0
  beq loop89
  subs r10, 0x10
  b blank_loop7

@ N
loop89:
  ldr r10, =0xa00000
  ldr r7, =0x5
  cmp r8, 0
  beq loop90
  cmp r9, 0
  beq blank_loop8
  bl set_row2
  bl turn_on_row2
  bl set_column2
  bl turn_off_row2
  bl clear_column2
  bl clear_row2
  bl set_row3
  bl turn_on_row3
  bl set_column3
  bl turn_off_row3
  bl clear_column3
  bl clear_row3  
  bl set_row4
  bl turn_on_row4
  bl set_column4
  bl turn_off_row4
  bl clear_column4
  bl clear_row4
  subs r8, 1
  subs r9, 1
  b loop89

loop90:
  ldr r10, =0xa00000
  ldr r8, =0x5
  cmp r7, 0
  beq loop89
  cmp r9, 0
  beq blank_loop8
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl set_column1
  bl set_column5
  bl clear_column1
  bl clear_column5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r7, 1
  subs r9, 1
  b loop90

blank_loop8:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  ldr r5, =0x5
  cmp r10, 0
  beq loop91
  subs r10, 0x10
  b blank_loop8

@ D
loop91:
  ldr r10, =0xa00000
  ldr r7, =0x5
  ldr r6, =0x5
  cmp r8, 0
  beq loop92
  cmp r9, 0
  beq blank_loop9
  bl set_row1
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_row5
  bl set_column1
  bl turn_on_row1
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_on_row5
  bl turn_off_row1
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl turn_off_row5
  bl clear_column1
  bl clear_row1
  bl clear_row2
  bl clear_row3
  bl clear_row4
  bl clear_row5
  subs r8, 1
  subs r9, 1
  b loop91

loop92:
  ldr r10, =0xa00000
  ldr r8, =0x5
  ldr r6, =0x5
  cmp r7, 0
  beq loop93
  cmp r9, 0
  beq blank_loop9
  bl set_row1
  bl set_row5
  bl turn_on_row1
  bl turn_on_row5
  bl set_column2
  bl set_column3
  bl set_column4
  bl turn_off_row1
  bl turn_off_row5
  bl clear_column2
  bl clear_column3
  bl clear_column4
  bl clear_row1
  bl clear_row5
  subs r7, 1
  subs r9, 1
  b loop92

loop93:
  ldr r10, =0xa00000
  ldr r8, =0x5
  ldr r7, =0x5
  cmp r6, 0
  beq loop91
  cmp r9, 0
  beq blank_loop9
  bl set_row2
  bl set_row3
  bl set_row4
  bl set_column5
  bl turn_on_row2
  bl turn_on_row3
  bl turn_on_row4
  bl turn_off_row2
  bl turn_off_row3
  bl turn_off_row4
  bl clear_column5
  bl clear_row2
  bl clear_row3
  bl clear_row4
  subs r6, 1
  subs r9, 1
  b loop93

blank_loop9:
  ldr r9, =0xffff
  ldr r8, =0x5
  ldr r7, =0x5
  ldr r6, =0x5
  ldr r5, =0x100000
  cmp r10, 0
  beq loop94
  subs r10, 0x10
  b blank_loop9

@ Smile
loop94:
  ldr r10, =0x2000
  cmp r5, 0
  beq exit
  cmp r9, 0
  beq loop95
  bl set_row2
  bl set_row4
  bl turn_on_row2
  bl turn_on_row4
  bl set_column2
  bl set_column4
  bl clear_column2
  bl clear_column4
  bl turn_off_row2
  bl turn_off_row4
  bl set_row5
  bl turn_on_row5
  bl set_column3
  bl clear_row2
  bl clear_row4
  bl clear_column3
  bl turn_off_row5
  bl clear_row5
  subs r9, 1
  subs r5, 1
  b loop94

loop95:
  ldr r9, =0xffff
  cmp r5, 0
  beq exit
  cmp r10, 0
  beq loop94
  bl set_row4
  bl turn_on_row4
  bl set_column2
  bl set_column4
  bl clear_column2
  bl clear_column4
  bl turn_off_row4
  bl set_row5
  bl turn_on_row5
  bl set_column3
  bl clear_row4
  bl clear_column3
  bl turn_off_row5
  bl clear_row5
  subs r10, 1
  subs r5, 1
  b loop95

exit:
  pop {r5, r6, r7, r8, r9, r10, lr}
  
.size main, .-main