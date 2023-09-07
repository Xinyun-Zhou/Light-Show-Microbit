---
title: "COMP2300 Assignment 1 Design Document"
author: Xinyun Zhou
email: u7326123@anu.edu.au
---

<!-- write your design document here -->
### What  
I use my microbit to create a light show of more than 30s by using LEDs without any other input peripherals on the microbit. My light show start with "SHOWTIME" letters. There are two different present ways. One is each letter coming from left to right and staying on screen for 1 second. Another one is that each letter blinks on the screen. After that, there will be two different types of pictures present on the screen. One is arrows. I have four different directions of arrows. From right to left, from left to right, from top to bottom and from bottom to top. Another type of picture is geometric symmetric centre shapes. There are three different shapes and they are all radiating from a middle LED. These pictures will repeat three to five times. I use these pictures to create a light show. The program will end with "END" letters and a smiley face. After the smiley face blinks a few times, the show will back to the start and repeat all steps.

### How   
I create two basic functions, `set_bit` and `clear_bit`. For the `set_bit` function, I load memory to a register, then I make some changes for this number (by using `lsl` and `orr`) and store it back to the place where it was. For the `set_bit` function, we should turn on the pins. Where for the `clear_bit` function, I do a similar thing as I have done for set_bit, but this time, the `clear_bit` function should turn off the pins. （`set_bit` and `clear_bit` are below)  
To simplify my codes, I use some small loops like `set_row4`, `turn_on_row1` and `clear_column1` so that I don't have to remember the index and type it multiple times. (`set_column4`, `turn_on_row1` and `clear_row1` are below)  
I use for loop to iterate through all my steps about the `set_bit` and `clear_bit` for one frame. I load part of the pattern from the array stored in memory for every iteration I create.  
I used memory to help me create the light show. For each time I call a register, I used `ldr` rather than `movs`. The reason is when I call `movs` for multiple times, then it will be an error that shows up and says `"offset out of range"`. Because there is limited space for a register. But when I use `ldr`, I make some changes to the value stored on the memory. It would not affect my result until I use the `str`.  
Also, I `push` and `pop` the `lr` and other registers all the time. 

### Why  
I think my design choices are appropriate for the task. The first reason is that the requirement says "the light show must be engaging for a viewer for at least 30 seconds. " and my design meets the minimum time requirement. The second reason is that my lights are changing every second except to show the letters. Because I am worried about the viewer can not recognize the letters I show, thus I decide to show the letters a bit slower. 

### Codes 
```
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
```
```
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
```
```
set_column4:
  push {r1, r3, lr}
  add r1, r1, 0x00000300
  ldr r3, =#5
  bl set_bit
  pop {r1, r3, lr}
  bx lr
```
```
turn_on_row1:
  push {r2, r3, lr}
  ldr r2, =0x504
  ldr r3, =#21
  bl set_bit
  pop {r2, r3, lr}
  bx lr
```
```
clear_row1:
  push {r3, lr}
  ldr r3, =#21
  bl clear_bit
  pop {r3, lr}
  bx lr
```
