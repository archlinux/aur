# Term-Sudoku

This is a terminal application to play the game of Sudoku.

## Build

### Prerequisites

- ncurses
- dialog for filechoosing

### Makefile

`$ make build`

creates a "bin" folder with the binary.

`$ make install`

copies that binary to /usr/local/bin.

## AUR

Install via (using paru)

`$ paru -Syu term-sudoku`

## Usage

When you start the program with

`$ make run` or `$ bin/term-sudoku`

a sudoku is generated for you (run with '-v' flag to see that process).
Using the controls displayed on the screen insert numbers.
It's going to look like this:

![Example](https://raw.githubusercontent.com/theeyeofcthulhu/term-sudoku/master/example.png)

When you save with s a file like this is generated (the first line is the
puzzle and the second is the solution the use fill in):

```
000260701680070090190004500820100040004602900050003028009300074040050036703018000
000000000000000000000000000000000000000000000000000000000000000000000000000000000
```

Continue where you left of with

`$ bin/term-sudoku -f your_file`

See more flags and help with the -h flag.

You start in "normal mode". Meaning you type in numbers for the solution
into the grid. When pressing e you get into "Note Mode", where you can
note numbers that would fit into that square. Every number there is like
a switch: press a number to toggle it's visibility as a note.

## Generation of the Sudoku

To see this process run with -v flag. What happens is from left to right
and top to bottom the first three blocks are filled with the values 1 to 9
randomly.  This pattern follows the sudoku rules as no vertical or horizontal
lines interfere. Then, using backtracking the rest of the squares are filled,
leaving us with a fully filled sudoku grid.  Afterwards numbers are removed one
by one and, using backtracking, the solutions to the puzzle with the removed
numbers are counted.  Once there is more than one solution the removal is
stopped.
