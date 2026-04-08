#!/usr/bin/env python

import curses
import os
import pickle
import random
import time

PICKLE_FILE = os.path.join(
    os.path.dirname(os.path.abspath(__file__)), "snake_high_score.pkl"
)
score = 0
highscore = 0


def load_highscore():
    global highscore
    try:
        with open(PICKLE_FILE, "rb") as f:
            highscore = pickle.load(f)
    except (FileNotFoundError, EOFError):
        highscore = 0


def save_highscore():
    global highscore
    with open(PICKLE_FILE, "wb") as f:
        pickle.dump(highscore, f)


def init_colors():
    """Initialize custom color pairs"""
    curses.start_color()
    curses.use_default_colors()
    curses.init_pair(1, curses.COLOR_GREEN, -1)  # Snake body - green
    curses.init_pair(2, curses.COLOR_YELLOW, -1)  # Snake head - yellow
    curses.init_pair(3, curses.COLOR_RED, -1)  # Food - red
    curses.init_pair(4, curses.COLOR_CYAN, -1)  # Border - cyan
    curses.init_pair(5, curses.COLOR_MAGENTA, -1)  # Score - magenta
    curses.init_pair(6, curses.COLOR_WHITE, -1)  # Text - white
    curses.init_pair(7, curses.COLOR_BLACK, curses.COLOR_GREEN)  # Snake body filled
    curses.init_pair(8, curses.COLOR_BLACK, curses.COLOR_YELLOW)  # Snake head filled
    curses.init_pair(9, curses.COLOR_BLACK, curses.COLOR_RED)  # Food filled


def draw_border(win, sh, sw):
    """Draw a beautiful double-line border around the game area"""
    win.addch(0, 0, "╔", curses.color_pair(4) | curses.COLOR_BLUE)
    win.addch(0, sw - 1, "╗", curses.color_pair(4) | curses.COLOR_BLUE)
    win.addch(sh - 1, 0, "╚", curses.color_pair(4) | curses.COLOR_BLUE)

    try:
        win.addch(sh - 1, sw - 1, "╝", curses.color_pair(4) | curses.COLOR_BLUE)
    except curses.error:
        pass
    for x in range(1, sw - 1):
        win.addch(0, x, "═", curses.color_pair(4) | curses.COLOR_BLUE)
        try:
            win.addch(sh - 1, x, "═", curses.color_pair(4) | curses.COLOR_BLUE)
        except curses.error:
            pass
    for y in range(1, sh - 1):
        win.addch(y, 0, "║", curses.color_pair(4) | curses.COLOR_BLUE)
        try:
            win.addch(y, sw - 1, "║", curses.color_pair(4) | curses.COLOR_BLUE)
        except curses.error:
            pass


def draw_snake(win, snake):
    """Draw the snake with gradient colors and different head"""
    for i, segment in enumerate(snake):
        y, x = segment[0], segment[1]
        if i == 0:  # Head
            win.addch(y, x, "●", curses.color_pair(2) | curses.A_BOLD)
        else:  # Body - alternate characters for visual effect
            char = "█" if i % 3 == 0 else "▓" if i % 3 == 1 else "░"
            win.addch(y, x, char, curses.color_pair(1))


def draw_food(win, food, frame):
    """Draw animated food with pulsing effect"""
    chars = ["★", "☆", "◆", "◇"]
    char = chars[frame % len(chars)]
    win.addch(food[0], food[1], char, curses.color_pair(3) | curses.A_BOLD)


def draw_header(win, sw, score, high_score):
    """Draw a beautiful header with score and high score"""
    title = " SNAKE GAME "
    win.addstr(0, (sw - len(title)) // 2, title, curses.color_pair(5) | curses.A_BOLD)
    score_text = f" Score: {score} "
    high_text = f" High: {high_score} "
    win.addstr(0, 2, score_text, curses.color_pair(2) | curses.A_BOLD)
    win.addstr(0, sw - len(high_text) - 2, high_text, curses.color_pair(5))


def show_game_over(win, sh, sw, score, high_score):
    """Display animated game over screen"""
    center_y, center_x = sh // 2, sw // 2
    messages = [
        "╔══════════════════════════════╗",
        "║                              ║",
        "║        ╔═ GAME OVER ═╗       ║",
        "║                              ║",
        f"║       Score: {score:5}           ║",
        f"║       High Score: {high_score:5}      ║",
        "║                              ║",
        "║     [R] Restart [Q] Quit     ║",
        "║                              ║",
        "╚══════════════════════════════╝",
    ]
    start_y = center_y - len(messages) // 2
    start_x = center_x - len(messages[0]) // 2
    for i, msg in enumerate(messages):
        win.addstr(
            start_y + i,
            start_x,
            msg,
            curses.color_pair(3) | curses.A_BOLD
            if "GAME OVER" in msg
            else curses.color_pair(6),
        )
    win.refresh()


def show_start_screen(win, sh, sw):
    """Display a beautiful start screen"""
    win.clear()
    draw_border(win, sh, sw)
    title_lines = [
        "╔══════════════════════════════════════╗",
        "║                                      ║",
        "║  ███████╗██╗  ██╗██████╗   ██████╗   ║",
        "║  ██╔════╝██║  ██║██╔══ ██╗██╔═══██╗  ║",
        "║  ███████╗██║  ██║██║   ██║██║   ██║  ║",
        "║  ╚════██║██║  ██║██║   ██║██║   ██║  ║",
        "║  ███████║╚██████╔╝██████╔╝╚██████╔╝  ║",
        "║  ╚══════╝ ╚═════╝ ╚═════╝  ╚═════╝   ║",
        "║                                      ║",
        "║             SNAKE GAME               ║",
        "║         Help Python to eat!          ║",
        "╚══════════════════════════════════════╝",
    ]
    start_y = sh // 2 - len(title_lines) // 2
    for i, line in enumerate(title_lines):
        x = (sw - len(line)) // 2
        color = (
            curses.color_pair(5) | curses.A_BOLD
            if i in [2, 3, 4, 5, 6, 7]
            else curses.color_pair(4)
        )
        win.addstr(start_y + i, x, line, color)
    instructions = [
        "Use Arrow Keys or WASD to move",
        "Press SPACE to start, Q to quit",
    ]
    for i, inst in enumerate(instructions):
        win.addstr(
            start_y + len(title_lines) + 2 + i,
            (sw - len(inst)) // 2,
            inst,
            curses.color_pair(6),
        )
    win.refresh()
    # Wait for input
    while True:
        key = win.getch()
        if key == ord(" "):
            return True
        elif key == ord("q"):
            return False


def main(stdscr):
    global highscore
    curses.curs_set(0)  # Hide cursor
    init_colors()
    sh, sw = stdscr.getmaxyx()
    win = curses.newwin(sh, sw, 0, 0)
    win.keypad(1)
    win.timeout(100)
    load_highscore()
    high_score = highscore
    if not show_start_screen(win, sh, sw):
        return
    while True:
        win.clear()
        draw_border(win, sh, sw)
        min_y, max_y = 1, sh - 2
        min_x, max_x = 1, sw - 2
        snake_y = sh // 2
        snake_x = sw // 4
        snake = [
            [snake_y, snake_x],
            [snake_y, snake_x - 1],
            [snake_y, snake_x - 2],
            [snake_y, snake_x - 3],
            [snake_y, snake_x - 4],
        ]
        food = [sh // 2, sw // 2]
        frame = 0
        key = curses.KEY_RIGHT
        last_key = curses.KEY_RIGHT
        score = 0
        while True:
            frame += 1
            next_key = win.getch()
            if next_key != -1:
                if (
                    (next_key == curses.KEY_UP and last_key != curses.KEY_DOWN)
                    or (next_key == curses.KEY_DOWN and last_key != curses.KEY_UP)
                    or (next_key == curses.KEY_LEFT and last_key != curses.KEY_RIGHT)
                    or (next_key == curses.KEY_RIGHT and last_key != curses.KEY_LEFT)
                ):
                    key = next_key
                    last_key = key
                elif next_key == ord("w") and last_key != curses.KEY_DOWN:
                    key = curses.KEY_UP
                    last_key = key
                elif next_key == ord("s") and last_key != curses.KEY_UP:
                    key = curses.KEY_DOWN
                    last_key = key
                elif next_key == ord("a") and last_key != curses.KEY_RIGHT:
                    key = curses.KEY_LEFT
                    last_key = key
                elif next_key == ord("d") and last_key != curses.KEY_LEFT:
                    key = curses.KEY_RIGHT
                    last_key = key
                elif next_key == ord("q"):
                    exit()
                elif next_key == ord(" "):
                    # Pause the game
                    paused_text = "PAUSED"
                    text_x = (sw - len(paused_text)) // 2
                    win.addstr(
                        sh // 2,
                        text_x,
                        paused_text,
                        curses.color_pair(5) | curses.A_BOLD,
                    )
                    win.refresh()
                    win.nodelay(0)
                    while True:
                        pause_key = win.getch()
                        if pause_key == ord(" "):
                            break
                        elif pause_key == ord("q"):
                            exit()
                    win.timeout(100)
            new_head = [snake[0][0], snake[0][1]]
            if key == curses.KEY_DOWN:
                new_head[0] += 1
            elif key == curses.KEY_UP:
                new_head[0] -= 1
            elif key == curses.KEY_LEFT:
                new_head[1] -= 1
            elif key == curses.KEY_RIGHT:
                new_head[1] += 1
            if (
                new_head[0] < min_y
                or new_head[0] > max_y
                or new_head[1] < min_x
                or new_head[1] > max_x
                or new_head in snake
            ):
                if score > high_score:
                    high_score = score
                    highscore = score
                    save_highscore()
                show_game_over(win, sh, sw, score, high_score)
                time.sleep(1)
                win.nodelay(0)
                restart_key = win.getch()
                if restart_key == ord("q"):
                    exit()
                elif restart_key == ord("r"):
                    curses.wrapper(main)
                else:
                    exit()
            snake.insert(0, new_head)
            if snake[0] == food:
                score += 10
                if score > high_score:
                    high_score = score
                    highscore = score
                    save_highscore()
                while True:
                    food = [
                        random.randint(min_y + 1, max_y - 1),
                        random.randint(min_x + 1, max_x - 1),
                    ]
                    if food not in snake:
                        break
            else:
                tail = snake.pop()
                win.addch(tail[0], tail[1], " ")
            win.clear()
            draw_border(win, sh, sw)
            draw_header(win, sw, score, high_score)
            draw_snake(win, snake)
            draw_food(win, food, frame)
            win.refresh()


if __name__ == "__main__":
    curses.wrapper(main)
