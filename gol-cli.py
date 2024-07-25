#!/usr/bin/env python3

import os
import time
import argparse
import shutil
import signal
import numpy as np

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

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def print_grid(grid, cell_color):
    color_code = COLOR_CODES.get(cell_color, COLOR_CODES['white'])
    reset_code = COLOR_CODES['reset']
    for row in grid:
        print(''.join([f'{color_code}█{reset_code}' if cell else ' ' for cell in row]))

def hide_cursor():
    print("\033[?25l", end='', flush=True)

def show_cursor():
    print("\033[?25h", end='', flush=True)

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
    args = parser.parse_args()

    def handle_resize(signum, frame):
        nonlocal grid
        rows, cols = get_terminal_size()
        grid = generate_random_grid(rows, cols, args.probability)
        seen_configurations.clear()

    signal.signal(signal.SIGWINCH, handle_resize)

    rows, cols = get_terminal_size()
    grid = generate_random_grid(rows, cols, args.probability)
    
    hide_cursor()
    seen_configurations = set()
    
    try:
        while True:
            grid_hash = hash_grid(grid)
            if grid_hash in seen_configurations:
                #print("Grid has repeated. Restarting simulation...")
                rows, cols = get_terminal_size()
                grid = generate_random_grid(rows, cols, args.probability)
                seen_configurations.clear()
                time.sleep(args.time)
                continue
            seen_configurations.add(grid_hash)
            
            clear_screen()
            print_grid(grid, args.color)
            
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
