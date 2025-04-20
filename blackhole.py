import os
import time
import math
import random
import sys
import select
import threading
import json
try:
    import msvcrt
except ImportError:
    msvcrt = None

CONFIG_FILE = "sim_config.json"
STATS_FILE = "sim_stats.txt"

def load_config():
    try:
        with open(CONFIG_FILE, 'r') as f:
            config = json.load(f)
            return config.get('default_speed', 100), config.get('show_background', True)
    except (FileNotFoundError, json.JSONDecodeError):
        return 100, True

def save_config(speed, show_background):
    try:
        with open(CONFIG_FILE, 'w') as f:
            json.dump({'default_speed': speed, 'show_background': show_background}, f)
    except Exception as e:
        print(f"Error saving config: {e}")

def load_stats():
    try:
        with open(STATS_FILE, 'r') as f:
            lines = f.readlines()
            stats = []
            for line in lines:
                if line.strip():
                    parts = line.strip().split(', ')
                    stars = int(parts[0].split(': ')[1])
                    frames = int(parts[1].split(': ')[1])
                    stats.append((stars, frames))
            return stats[-10:] if len(stats) > 10 else stats, stats
    except (FileNotFoundError, ValueError):
        return [], []

def log_stats(num_stars, frame_count):
    try:
        with open(STATS_FILE, 'a') as f:
            f.write(f"Stars: {num_stars}, Frames: {frame_count}\n")
    except Exception as e:
        print(f"Error logging stats: {e}")

def clear_stats():
    try:
        with open(STATS_FILE, 'w') as f:
            f.write("")
    except Exception as e:
        print(f"Error clearing stats: {e}")

DEFAULT_SPEED, SHOW_BACKGROUND = load_config()

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def get_terminal_size():
    try:
        size = os.get_terminal_size()
        height = size.lines - 6
        width = size.columns - 2
        if width > 2 * height:
            width = 2 * height
        elif width < 2 * height:
            height = width // 2
        width = max(width, 20)
        height = max(height, 10)
        return width, height
    except OSError:
        return 20, 10

def create_background_grid(width, height):
    grid = [[' ' for _ in range(width)] for _ in range(height)]
    background_chars = ['.', ',', '*']
    for y in range(height):
        for x in range(width):
            if random.random() < 0.1:
                grid[y][x] = random.choice(background_chars)
    return grid

def create_grid(width, height, background_grid, shift_offset, shining_stars, frame_count, show_background):
    grid = [[' ' for _ in range(width)] for _ in range(height)]
    
    if show_background:
        for y in range(height):
            for x in range(width):
                src_x = (x - shift_offset) % width
                char = background_grid[y][src_x]
                if char != ' ':
                    if (y, x) in shining_stars:
                        grid[y][x] = f'\033[38;5;251m{char}\033[0m'
                    else:
                        grid[y][x] = f'\033[38;5;237m{char}\033[0m'

        num_new_shines = random.randint(1, 2)
        for _ in range(num_new_shines):
            for _ in range(10):
                y = random.randint(0, height - 1)
                x = random.randint(0, width - 1)
                src_x = (x - shift_offset) % width
                if background_grid[y][src_x] != ' ' and (y, x) not in shining_stars:
                    shining_stars[(y, x)] = 3
                    break

        expired = []
        for pos in shining_stars:
            shining_stars[pos] -= 1
            if shining_stars[pos] <= 0:
                expired.append(pos)
        for pos in expired:
            del shining_stars[pos]

    return grid

def place_black_hole(grid, center_x, center_y, width):
    if width < 65:
        if (center_y >= 0 and center_y < len(grid) and
            center_x - 1 >= 0 and center_x + 1 < len(grid[0])):
            grid[center_y][center_x - 1] = '\033[0m('
            grid[center_y][center_x] = '\033[0mX'
            grid[center_y][center_x + 1] = '\033[0m)'
    elif width > 95:
        if (center_y - 3 >= 0 and center_y + 2 < len(grid) and
            center_x - 10 >= 0 and center_x + 10 < len(grid[0])):
            for i in range(-3, 3):
                grid[center_y - 3][center_x + i] = '\033[0m+'
            for i in [-4, -3, -2, 2, 3, 4]:
                grid[center_y - 2][center_x + i] = '\033[0m+'
            for i in [-5, -4, -3, 3, 4, 5]:
                grid[center_y - 1][center_x + i] = '\033[0m+'
            grid[center_y][center_x - 10] = '\033[0m/'
            for i in [-9, -8, -7, -6, -2, -1, 0, 1, 2, 6, 7, 8, 9]:
                grid[center_y][center_x + i] = '\033[0m-'
            for i in [-5, -4, -3, 3, 4, 5]:
                grid[center_y][center_x + i] = '\033[0m+'
            grid[center_y][center_x + 10] = '\033[0m/'
            for i in [-5, -4, -3, 3, 4, 5]:
                grid[center_y + 1][center_x + i] = '\033[0m+'
            for i in range(-3, 3):
                grid[center_y + 2][center_x + i] = '\033[0m+'
    else:
        if (center_y - 1 >= 0 and center_y + 1 < len(grid) and
            center_x - 4 >= 0 and center_x + 4 < len(grid[0])):
            grid[center_y - 1][center_x - 1] = '\033[0m@'
            grid[center_y - 1][center_x] = '\033[0m@'
            grid[center_y - 1][center_x + 1] = '\033[0m@'
            grid[center_y][center_x - 4] = '\033[0m-'
            grid[center_y][center_x - 3] = '\033[0m-'
            grid[center_y][center_x - 2] = '\033[0m@'
            grid[center_y][center_x - 1] = '\033[0m-'
            grid[center_y][center_x] = '\033[0mx'
            grid[center_y][center_x + 1] = '\033[0m-'
            grid[center_y][center_x + 2] = '\033[0m@'
            grid[center_y][center_x + 3] = '\033[0m-'
            grid[center_y][center_x + 4] = '\033[0m-'
            grid[center_y + 1][center_x - 1] = '\033[0m@'
            grid[center_y + 1][center_x] = '\033[0m@'
            grid[center_y + 1][center_x + 1] = '\033[0m@'

def place_star(grid, x, y, width):
    x, y = int(x), int(y)
    if width > 85:
        if (y >= 0 and y < len(grid) and
            x - 1 >= 0 and x + 1 < len(grid[0])):
            grid[y][x - 1] = '\033[0m('
            grid[y][x] = '\033[0m@'
            grid[y][x + 1] = '\033[0m)'
    else:
        if (y >= 0 and y < len(grid) and
            x >= 0 and x < len(grid[0])):
            grid[y][x] = '\033[0m@'

def calculate_acceleration(r, mass=5e6, G=0.2):
    return G * mass / (r ** 2 + 0.1)

def handle_key_presses(speed_info):
    global DEFAULT_SPEED, SHOW_BACKGROUND
    if os.name == 'nt' and msvcrt:
        while not speed_info['stop']:
            if msvcrt.kbhit():
                key = msvcrt.getch()
                if key == b'\x1b':
                    if speed_info['paused']:
                        speed_info['paused'] = False
                        speed_info['clear_prompt'] = False
                        speed_info['message'] = "Resuming simulation"
                    else:
                        speed_info['stop'] = True
                        speed_info['message'] = "Exiting simulation"
                    time.sleep(0.3)
                    continue
                key = key.lower()
                if key == b'w' and not speed_info['paused']:
                    speed_info['speed'] = min(speed_info['speed'] + 25, 500)
                    speed_info['message'] = f"Speed increased to {speed_info['speed']}%"
                    time.sleep(0.1)
                elif key == b's' and not speed_info['paused']:
                    speed_info['speed'] = max(speed_info['speed'] - 25, 25)
                    speed_info['message'] = f"Speed decreased to {speed_info['speed']}%"
                    time.sleep(0.1)
                elif key == b'x' and not speed_info['paused']:
                    DEFAULT_SPEED = speed_info['speed']
                    save_config(DEFAULT_SPEED, SHOW_BACKGROUND)
                    speed_info['message'] = f"Default speed set to {DEFAULT_SPEED}%"
                    time.sleep(0.1)
                elif key == b'b' and not speed_info['paused']:
                    SHOW_BACKGROUND = not SHOW_BACKGROUND
                    speed_info['show_background'] = SHOW_BACKGROUND
                    save_config(DEFAULT_SPEED, SHOW_BACKGROUND)
                    speed_info['message'] = f"Background {'enabled' if SHOW_BACKGROUND else 'disabled'}"
                    time.sleep(0.1)
                elif key == b'e' and not speed_info['clear_prompt']:
                    speed_info['paused'] = not speed_info['paused']
                    speed_info['message'] = "Leaderboard displayed" if speed_info['paused'] else "Resuming simulation"
                    time.sleep(0.1)
                elif key == b'c' and speed_info['paused'] and not speed_info['clear_prompt']:
                    speed_info['clear_prompt'] = True
                    time.sleep(0.1)
                elif speed_info['clear_prompt']:
                    if key in [b'y', b'Y']:
                        clear_stats()
                        speed_info['clear_prompt'] = False
                        speed_info['message'] = "Simulation data cleared"
                        time.sleep(0.1)
                    elif key in [b'n', b'N']:
                        speed_info['clear_prompt'] = False
                        speed_info['message'] = "Data clear cancelled"
                        time.sleep(0.1)
            time.sleep(0.01)
    else:
        def set_nonblocking_input():
            import termios
            import tty
            fd = sys.stdin.fileno()
            old_settings = termios.tcgetattr(fd)
            tty.setcbreak(fd)
            return old_settings, fd

        def restore_terminal(old_settings, fd):
            import termios
            termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)

        old_settings, fd = set_nonblocking_input()
        try:
            while not speed_info['stop']:
                r, _, _ = select.select([sys.stdin], [], [], 0.01)
                if r:
                    key = sys.stdin.read(1)
                    if key == '\x1b':
                        if speed_info['paused']:
                            speed_info['paused'] = False
                            speed_info['clear_prompt'] = False
                            speed_info['message'] = "Resuming simulation"
                        else:
                            speed_info['stop'] = True
                            speed_info['message'] = "Exiting simulation"
                        time.sleep(0.3)
                        continue
                    key = key.lower()
                    if key == 'w' and not speed_info['paused']:
                        speed_info['speed'] = min(speed_info['speed'] + 25, 500)
                        speed_info['message'] = f"Speed increased to {speed_info['speed']}%"
                        time.sleep(0.1)
                    elif key == 's' and not speed_info['paused']:
                        speed_info['speed'] = max(speed_info['speed'] - 25, 25)
                        speed_info['message'] = f"Speed decreased to {speed_info['speed']}%"
                        time.sleep(0.1)
                    elif key == 'x' and not speed_info['paused']:
                        DEFAULT_SPEED = speed_info['speed']
                        save_config(DEFAULT_SPEED, SHOW_BACKGROUND)
                        speed_info['message'] = f"Default speed set to {DEFAULT_SPEED}%"
                        time.sleep(0.1)
                    elif key == 'b' and not speed_info['paused']:
                        SHOW_BACKGROUND = not SHOW_BACKGROUND
                        speed_info['show_background'] = SHOW_BACKGROUND
                        save_config(DEFAULT_SPEED, SHOW_BACKGROUND)
                        speed_info['message'] = f"Background {'enabled' if SHOW_BACKGROUND else 'disabled'}"
                        time.sleep(0.1)
                    elif key == 'e' and not speed_info['clear_prompt']:
                        speed_info['paused'] = not speed_info['paused']
                        speed_info['message'] = "Leaderboard displayed" if speed_info['paused'] else "Resuming simulation"
                        time.sleep(0.1)
                    elif key == 'c' and speed_info['paused'] and not speed_info['clear_prompt']:
                        speed_info['clear_prompt'] = True
                        time.sleep(0.1)
                    elif speed_info['clear_prompt']:
                        if key in ['y', 'Y']:
                            clear_stats()
                            speed_info['clear_prompt'] = False
                            speed_info['message'] = "Simulation data cleared"
                            time.sleep(0.1)
                        elif key in ['n', 'N']:
                            speed_info['clear_prompt'] = False
                            speed_info['message'] = "Data clear cancelled"
                            time.sleep(0.1)
        finally:
            restore_terminal(old_settings, fd)

def simulate_orbits(num_stars, steps):
    width, height = get_terminal_size()
    background_grid = create_background_grid(width, height)
    center_x, center_y = width // 2, height // 2
    
    stars = []
    for _ in range(num_stars):
        radius = random.uniform(10, min(width, height) / 2.5) if width > 85 else random.uniform(7, min(width, height) / 3)
        angle = random.uniform(0, 2 * math.pi)
        v = math.sqrt(calculate_acceleration(radius) * radius) * random.uniform(0.7, 0.9)
        vx = -v * math.sin(angle)
        vy = v * math.cos(angle)
        x = center_x + radius * math.cos(angle)
        y = center_y + radius * math.sin(angle)
        stars.append({
            'x': x,
            'y': y,
            'vx': vx,
            'vy': vy,
            'mass': random.uniform(100, 1000),
            'active': True
        })
    
    frame_count = 0
    shift_counter = 0
    shift_offset = 0
    shining_stars = {}
    max_steps = steps if steps > 0 else float('inf')
    
    speed_info = {'speed': DEFAULT_SPEED, 'stop': False, 'message': '', 'show_background': SHOW_BACKGROUND, 'paused': False, 'clear_prompt': False}
    key_thread = threading.Thread(target=handle_key_presses, args=(speed_info,))
    key_thread.daemon = True
    key_thread.start()
    
    try:
        while frame_count < max_steps:
            if speed_info['stop']:
                print("\nSimulation stopped.")
                break
                
            clear_screen()
            if speed_info['paused']:
                recent_stats, all_stats = load_stats()
                print("#" * 41)
                print(f"#{'SCORE BOARD':^39}#")
                print("#" * 41)
                print(f"#{'Last 10 simulations:':<39}#")
                for i, (stars_count, frames) in enumerate(reversed(recent_stats), 1):
                    print(f"# {f'Sim #{len(recent_stats)-i+1} - Stars = {stars_count}, Frames = {frames}':<37} #")
                for _ in range(10 - len(recent_stats)):
                    print(f"#{'':<39}#")
                print("#" * 41)
                print(f"#{'AVERAGES':^39}#")
                print("#" * 41)
                print(f"#{'':<39}#")
                avg_frames = sum(frames for _, frames in all_stats) / len(all_stats) if all_stats else 0
                print(f"#{'Average Frames':^39}#")
                print(f"#{f'{avg_frames:.0f}':^39}#")
                print(f"#{'':<39}#")
                print("#" * 41)
                if speed_info['clear_prompt']:
                    print("\nAre you sure? (y/n)")
                else:
                    print("\nPress 'e' or Esc to resume")
                    print("Or press 'c' to clear all simulation data")
                time.sleep(0.1)
                continue
            
            new_width, new_height = get_terminal_size()
            if new_width != width or new_height != height:
                old_center_x, old_center_y = center_x, center_y
                width, height = new_width, new_height
                center_x, center_y = width // 2, height // 2
                background_grid = create_background_grid(width, height)
                shining_stars.clear()
                dx = center_x - old_center_x
                dy = center_y - old_center_y
                for star in stars:
                    if star['active']:
                        star['x'] += dx
                        star['y'] += dy
            
            grid = create_grid(width, height, background_grid, shift_offset, shining_stars, frame_count, speed_info['show_background'])
            place_black_hole(grid, center_x, center_y, width)
            
            if speed_info['show_background'] and shift_counter >= 5:
                shift_offset = (shift_offset + 1) % width
                shift_counter = 0
                for y in range(height):
                    background_grid[y][shift_offset] = random.choice(['.', ',', '*']) if random.random() < 0.1 else ' '
            shift_counter += 1
            
            active_stars = [s for s in stars if s['active']]
            for i, star in enumerate(active_stars):
                if not star['active']:
                    continue
                    
                dx = star['x'] - center_x
                dy = star['y'] - center_y
                r = math.sqrt(dx**2 + dy**2)
                
                if r < 2:
                    star['active'] = False
                    continue
                
                if (star['x'] < -10 or star['x'] > width + 10 or 
                    star['y'] < -10 or star['y'] > height + 10):
                    star['active'] = False
                    continue
                
                if r > 0.1:
                    acc = calculate_acceleration(r)
                    ax = -acc * dx / r
                    ay = -acc * dy / r
                else:
                    ax, ay = 0, 0
                
                for j, other_star in enumerate(active_stars):
                    if i != j and other_star['active']:
                        dx_star = star['x'] - other_star['x']
                        dy_star = star['y'] - other_star['y']
                        dist = math.sqrt(dx_star**2 + dy_star**2 + 0.1)
                        if dist > 0.1:
                            acc_star = 0.1 * other_star['mass'] / (dist ** 2)
                            ax -= acc_star * dx_star / dist
                            ay -= acc_star * dy_star / dist
                
                star['vx'] += ax * 0.01
                star['vy'] += ay * 0.01
                star['x'] += star['vx'] * 0.01
                star['y'] += star['vy'] * 0.01
                
                speed = math.sqrt(star['vx']**2 + star['vy']**2)
                escape_speed = math.sqrt(2 * calculate_acceleration(r) * r)
                if speed > escape_speed:
                    star['active'] = False
                
                if star['active']:
                    place_star(grid, star['x'], star['y'], width)
            
            for row in grid:
                print(''.join(row))
            status = (f"Stars: {len(active_stars)}/{num_stars} | Frame: {frame_count + 1}{'/' + str(steps) if steps > 0 else ''} | Speed: {speed_info['speed']}% | 'w': +25% | 's': -25% | 'x': Set default ({DEFAULT_SPEED}%)\n"
                      f"'b': Toggle BG | 'e': Scoreboard | Esc or Ctrl+C to exit")
            if speed_info['message']:
                status += f" | {speed_info['message']}"
                speed_info['message'] = ''
            print(f"\n{status}")
            
            frame_count += 1
            delay = 0.1 * (100 / speed_info['speed'])
            time.sleep(delay)
            
            if len(active_stars) == 0 and steps == 0:
                print(f"\nAll stars gone! Total frames: {frame_count}")
                log_stats(num_stars, frame_count)
                break
    
    finally:
        speed_info['stop'] = True
        key_thread.join()
    
    return frame_count

def main():
    global DEFAULT_SPEED, SHOW_BACKGROUND
    try:
        num_stars_input = input("Enter the number of stars to orbit the black hole (default 1): ").strip()
        num_stars = int(num_stars_input) if num_stars_input else 1
        steps_input = input("Enter the number of simulation steps (default 0 for indefinite): ").strip()
        steps = int(steps_input) if steps_input else 0
        
        if num_stars < 0 or steps < 0:
            print("Please enter non-negative numbers.")
            return
        
        print(f"Controls: Press 'w' to increase speed (+25%), 's' to decrease speed (-25%), 'b' to toggle background (currently {'on' if SHOW_BACKGROUND else 'off'}), 'x' to set default speed (currently {DEFAULT_SPEED}%), 'e' to pause/leaderboard, Esc or Ctrl+C to stop.")
        frame_count = simulate_orbits(num_stars, steps)
        if steps > 0:
            print(f"\nSimulation completed. Total frames: {frame_count}")
            
    except ValueError:
        print("Please enter valid integers or leave blank for defaults.")
    except KeyboardInterrupt:
        print("\nSimulation stopped.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()