// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// n = 8192
(START)
    @8192
    D = A
    @n
    M = D

    // i = 0
    @i
    M = 0

(LOOP)
    //if i == n goto end
    @i
    D = M
    @n
    D = D - M
    @END
    D;JEQ

    //RAM[SCREEN + i] to -1
    @KBD
    D = M
    @WHITE
    D;JEQ

(BLACK)
    @i
    D = M
    @SCREEN
    A = A + D
    M = -1
    @INCREMENT
    0;JMP

(WHITE)
    @i
    D = M
    @SCREEN
    A = A + D
    M = 0

(INCREMENT)
    // i = i + 1
    @i
    M = M + 1

    //jump to LOOP
    @LOOP
    0;JMP

(END)
    @START
    0;JMP
