# HexaMorse v1.1

import curses
import time
import threading

MORSE_DICT = {
    ".-":"A","-...":"B","-.-.":"C","-..":"D",".":"E",
    "..-.":"F","--.":"G","....":"H","..":"I",".---":"J",
    "-.-":"K",".-..":"L","--":"M","-.":"N","---":"O",
    ".--.":"P","--.-":"Q",".-.":"R","...":"S","-":"T",
    "..-":"U","...-":"V",".--":"W","-..-":"X","-.--":"Y","--..":"Z"
}

LETTER_PAUSE = 0.7
typed_history = []
current_symbol = ""
last_input_time = time.time()
lock = threading.Lock()
CHEATSHEET_LINES = [f"{letter}: {code}" for code, letter in sorted(MORSE_DICT.items(), key=lambda x: x[1])]

def morse_loop(stdscr):
    global current_symbol, last_input_time
    curses.curs_set(0)
    stdscr.nodelay(True)
    stdscr.timeout(50)

    typed_history.append("HexaMorse v1.1")
    typed_history.append("Type '.' for dot and ',' for dash (Q to quit)")

    while True:
        try:
            key = stdscr.get_wch()
        except curses.error:
            key = None

        if key in ('.', ','):
            current_symbol += "." if key == '.' else "-"
            last_input_time = time.time()
        elif key in ('q', 'Q'):
            break

        if current_symbol and time.time() - last_input_time > LETTER_PAUSE:
            decoded = MORSE_DICT.get(current_symbol, "?")
            with lock:
                typed_history.append(f"{current_symbol} → {decoded}")
            current_symbol = ""

        stdscr.erase()
        height, width = stdscr.getmaxyx()
        with lock:
            for i, line in enumerate(typed_history[-height:]):
                stdscr.addstr(i, 0, line[:width-25])

        for i, line in enumerate(CHEATSHEET_LINES):
            x = width - 25
            if i < height:
                stdscr.addstr(i, x, line[:25])

        if current_symbol:
            stdscr.addstr(height-1, 0, f"Current: {current_symbol}")

        stdscr.refresh()
        time.sleep(0.01)

def main():
    curses.wrapper(morse_loop)

if __name__ == "__main__":
    main()