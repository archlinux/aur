#!/usr/bin/env python3

import os
import time
import argparse
import shutil
import signal
import numpy as np
import sys

# Color codes
COLOR_CODES = {
    'white': '\033[97m',
    'black': '\033[90m',
    'cyan': '\033[96m',
    'red': '\033[91m',
    'green': '\033[92m',
    'yellow': '\033[93m',
    'blue': '\033[94m',
    'magenta': '\033[95m',
    'reset': '\033[0m'
}

LOWER_HALF_BLOCK = '▄'
UPPER_HALF_BLOCK = '▀'
FULL_BLOCK = '█'
EMPTY_BLOCK = ' '

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def hide_cursor():
    print("\033[?25l", end='', flush=True)
    sys.stdout.flush()

def show_cursor():
    print("\033[?25h", end='', flush=True)
    sys.stdout.flush()

# function to print the grid when row is not divided
def print_grid(grid, cell_color):
    color_code = COLOR_CODES.get(cell_color, COLOR_CODES['white'])
    reset_code = COLOR_CODES['reset']
    for i, row in enumerate(grid):
        # calculates when the finishing symbol is '/n' or '' made to omit the last empty line
        end_char = '' if i == len(grid) - 1 else '\n'
        sys.stdout.write(''.join([f'{color_code}█{reset_code}' if cell else ' ' for cell in row])+ end_char)
    sys.stdout.flush()

# function to print the grid when row is not divided
## uses 2 buffers and display only the updated blocks
def print_grid_split(prev_grid, grid, cell_color):
    color_code = COLOR_CODES.get(cell_color, COLOR_CODES['white'])
    reset_code = COLOR_CODES['reset']
    buffer = []
    for i in range(0, len(grid), 2):
        line = ''
        # enumerated each 2 grid rows (1 terminal row)
        for j, col in enumerate(grid[i]):
            upper_cell = grid[i][j]
            lower_cell = grid[i + 1][j] if i + 1 < len(grid) else 0
            if upper_cell and lower_cell:
                char = f'{color_code}{FULL_BLOCK}{reset_code}'
            elif upper_cell:
                char = f'{color_code}{UPPER_HALF_BLOCK}{reset_code}'
            elif lower_cell:
                char = f'{color_code}{LOWER_HALF_BLOCK}{reset_code}'
            else:
                char = EMPTY_BLOCK
            if prev_grid is None or prev_grid[i // 2][j] != char:
                sys.stdout.write(f'\033[{i // 2 + 1};{j + 1}H{char}')
        buffer.append(line)
    sys.stdout.flush()

def get_neighbors(grid, x, y):
    return np.sum(grid[x-1:x+2, y-1:y+2]) - grid[x, y]

def next_generation(grid):
    neighbors = sum(np.roll(np.roll(grid, i, 0), j, 1) 
                    for i in (-1, 0, 1) for j in (-1, 0, 1) 
                    if (i, j) != (0, 0))
    return (neighbors == 3) | (grid & (neighbors == 2))

def generate_random_grid(rows, cols, prob):
    return np.random.random((rows, cols)) < prob

def get_terminal_size():
    term_size = shutil.get_terminal_size()
    return max(term_size.lines, 1), max(term_size.columns, 1)

def hash_grid(grid):
    return hash(grid.tostring())

def clear_screen_alt():
    print("\033[2J\033[3J\033[H")

def main():
    parser = argparse.ArgumentParser(description='Conway\'s Game of Life')
    parser.add_argument('-p', '--probability', type=float, default=0.2, help='Probability of a cell being alive at the start')
    parser.add_argument('-t', '--time', type=float, default=0.07, help='Time before the generation update')
    parser.add_argument('-c', '--color', type=str, default='white', choices=COLOR_CODES.keys(), help='Color of the cells')
    parser.add_argument('-d', '--divided', type=str, default='true', choices=['true', 'false'], help='Choose to display cells as squares or rectangles')
    args = parser.parse_args()

    def handle_resize(signum, frame):
        nonlocal grid, prev_grid
        rows, cols = get_terminal_size()
        if args.divided == 'true':
            rows=rows*2
        grid = generate_random_grid(rows, cols, args.probability)
        prev_grid = None
        seen_configurations.clear()

    signal.signal(signal.SIGWINCH, handle_resize)

    rows, cols = get_terminal_size()
    if args.divided == 'true':
        rows=rows*2
    grid = generate_random_grid(rows, cols, args.probability)
    
    prev_grid = None
    hide_cursor()
    seen_configurations = set()
    
    try:
        while True:
            grid_hash = hash_grid(grid)
            # if 2 generations start to repeat
            if grid_hash in seen_configurations:
                rows, cols = get_terminal_size()
                if args.divided == 'true':
                    rows=rows*2
                grid = generate_random_grid(rows, cols, args.probability)
                prev_grid = None
                seen_configurations.clear()
                time.sleep(args.time)
                continue
            seen_configurations.add(grid_hash)
            
            if args.divided == 'true':
                print_grid_split(prev_grid, grid, args.color)
            else:
                clear_screen()
                print_grid(grid, args.color)
                
        
            prev_grid = grid.copy()
            #start_time = time.time()
            grid = next_generation(grid)
            #end_time = time.time()
            #print(f"Time for next_generation: {end_time - start_time:.6f} seconds")
            
            
            time.sleep(args.time)
    except KeyboardInterrupt:
        clear_screen_alt()
        show_cursor()

if __name__ == "__main__":
    main()
