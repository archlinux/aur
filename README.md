# Term-Sudoku

This is a terminal application to play the game of Sudoku.

## Build

`$ make build`

creates a "bin" folder with the binary.

`$ make install`

copies that binary to /usr/local/bin.

## Usage

A Sudoku has 81 Fields and in the program it is represented as a linear string of characters with 0 being an empty field.
This repo includes the example.sudoku file which looks like this:

```
000260701680070090190004500820100040004602900050003028009300074040050036703018000
000000000000000000000000000000000000000000000000000000000000000000000000000000000
```

Here the first line is the sudoku and the second line is the user input which will be saved to the file.

When you start the program with that file as the argument like

(After having built with make)
`$ bin/term-sudoku example.sudoku`

or just

`$ make run`

it's going to look like this:

![Example](https://raw.githubusercontent.com/theeyeofcthulhu/term-sudoku/master/example.png)

White numbers are those set by the puzzle; blue numbers are your own which you set by moving the cursor with hjkl and typing a number.
To delete type 0 or x, to quit type q or Ctrl-c. To safe the file press s.

When you are done with the sudoku, type c and the program will tell you if you have an error and then in which line if so.
