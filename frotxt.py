#!/usr/bin/env python3

import curses
import sys
import os

VERSION = "0.1.0"
APPNAME = "pyvim"

KEYWORDS = [
    "def", "class", "import", "from", "return", "if", "else", "elif",
    "for", "while", "in", "not", "and", "or", "True", "False", "None",
    "try", "except", "with", "as", "pass", "break", "continue", "lambda",
    "yield", "global", "nonlocal", "del", "raise", "assert", "is",
    # C/bash keywords
    "int", "char", "void", "include", "echo", "then", "fi", "do", "done",
]

class Editor:
    def __init__(self, filename=None):
        self.filename = filename
        self.lines = [""]
        self.cy = 0  # cursor row
        self.cx = 0  # cursor col
        self.offset_y = 0
        self.offset_x = 0
        self.mode = "NORMAL"
        self.status_msg = ""
        self.command_buf = ""
        self.modified = False
        self.search_term = ""

        if filename and os.path.exists(filename):
            with open(filename, "r") as f:
                content = f.read()
            self.lines = content.splitlines()
            if not self.lines:
                self.lines = [""]
        elif filename:
            self.status_msg = f"New file: {filename}"

    def setup_colors(self):
        curses.start_color()
        curses.use_default_colors()
        # Pink to blue gradient for UI
        curses.init_pair(1, curses.COLOR_CYAN, -1)       # keywords
        curses.init_pair(2, curses.COLOR_GREEN, -1)       # strings
        curses.init_pair(3, curses.COLOR_YELLOW, -1)      # comments
        curses.init_pair(4, curses.COLOR_MAGENTA, -1)     # numbers
        curses.init_pair(5, curses.COLOR_WHITE, curses.COLOR_BLUE)   # status bar normal
        curses.init_pair(6, curses.COLOR_WHITE, curses.COLOR_MAGENTA) # status bar insert
        curses.init_pair(7, curses.COLOR_BLACK, curses.COLOR_CYAN)   # status bar command
        curses.init_pair(8, curses.COLOR_RED, -1)         # line numbers
        curses.init_pair(9, curses.COLOR_WHITE, -1)       # normal text

    def draw_status_bar(self, stdscr, h, w):
        filename = self.filename if self.filename else "[No Name]"
        modified = " [+]" if self.modified else ""
        left = f" {self.mode}  {filename}{modified}"
        right = f" {self.cy + 1}:{self.cx + 1} "
        spaces = w - len(left) - len(right)
        status = left + " " * max(0, spaces) + right

        if self.mode == "INSERT":
            color = curses.color_pair(6)
        elif self.mode == "COMMAND":
            color = curses.color_pair(7)
        else:
            color = curses.color_pair(5)

        try:
            stdscr.attron(color)
            stdscr.addstr(h - 2, 0, status[:w])
            stdscr.attroff(color)
        except curses.error:
            pass

    def draw_command_line(self, stdscr, h, w):
        try:
            stdscr.addstr(h - 1, 0, " " * w)
            if self.mode == "COMMAND":
                stdscr.addstr(h - 1, 0, ":" + self.command_buf)
            elif self.mode == "SEARCH":
                stdscr.addstr(h - 1, 0, "/" + self.command_buf)
            elif self.status_msg:
                stdscr.addstr(h - 1, 0, self.status_msg[:w])
        except curses.error:
            pass

    def highlight_line(self, stdscr, y, line, screen_y, offset_x, w):
        x = 0
        i = 0
        line_num_width = len(str(len(self.lines))) + 1
        draw_x = line_num_width + 1

        while i < len(line) and draw_x + x < w:
            ch = line[i]

            # Comment
            if ch == "#":
                rest = line[i:]
                try:
                    stdscr.addstr(screen_y, draw_x + x, rest[:w - draw_x - x], curses.color_pair(3))
                except curses.error:
                    pass
                break

            # String
            if ch in ('"', "'"):
                quote = ch
                end = i + 1
                while end < len(line) and line[end] != quote:
                    end += 1
                end += 1
                token = line[i:end]
                try:
                    stdscr.addstr(screen_y, draw_x + x, token[:w - draw_x - x], curses.color_pair(2))
                except curses.error:
                    pass
                x += len(token)
                i = end
                continue

            # Number
            if ch.isdigit():
                end = i
                while end < len(line) and line[end].isdigit():
                    end += 1
                token = line[i:end]
                try:
                    stdscr.addstr(screen_y, draw_x + x, token[:w - draw_x - x], curses.color_pair(4))
                except curses.error:
                    pass
                x += len(token)
                i = end
                continue

            # Keyword
            if ch.isalpha() or ch == "_":
                end = i
                while end < len(line) and (line[end].isalnum() or line[end] == "_"):
                    end += 1
                token = line[i:end]
                if token in KEYWORDS:
                    try:
                        stdscr.addstr(screen_y, draw_x + x, token[:w - draw_x - x], curses.color_pair(1) | curses.A_BOLD)
                    except curses.error:
                        pass
                else:
                    try:
                        stdscr.addstr(screen_y, draw_x + x, token[:w - draw_x - x], curses.color_pair(9))
                    except curses.error:
                        pass
                x += len(token)
                i = end
                continue

            try:
                stdscr.addstr(screen_y, draw_x + x, ch, curses.color_pair(9))
            except curses.error:
                pass
            x += 1
            i += 1

    def draw(self, stdscr):
        h, w = stdscr.getmaxyx()
        stdscr.erase()
        text_h = h - 2
        line_num_width = len(str(len(self.lines)))

        for screen_y in range(text_h):
            file_y = screen_y + self.offset_y
            if file_y >= len(self.lines):
                try:
                    stdscr.addstr(screen_y, 0, "~", curses.color_pair(8))
                except curses.error:
                    pass
                continue

            # Line number
            line_num = str(file_y + 1).rjust(line_num_width)
            try:
                stdscr.addstr(screen_y, 0, line_num, curses.color_pair(8))
            except curses.error:
                pass

            line = self.lines[file_y]
            visible = line[self.offset_x:]
            self.highlight_line(stdscr, file_y, visible, screen_y, self.offset_x, w)

        self.draw_status_bar(stdscr, h, w)
        self.draw_command_line(stdscr, h, w)

        # Position cursor
        screen_cy = self.cy - self.offset_y
        screen_cx = self.cx - self.offset_x + line_num_width + 1
        try:
            stdscr.move(screen_cy, screen_cx)
        except curses.error:
            pass

    def scroll(self, h, w):
        text_h = h - 2
        line_num_width = len(str(len(self.lines))) + 1
        text_w = w - line_num_width - 1

        if self.cy < self.offset_y:
            self.offset_y = self.cy
        if self.cy >= self.offset_y + text_h:
            self.offset_y = self.cy - text_h + 1
        if self.cx < self.offset_x:
            self.offset_x = self.cx
        if self.cx >= self.offset_x + text_w:
            self.offset_x = self.cx - text_w + 1

    def clamp_cx(self):
        line_len = len(self.lines[self.cy])
        if self.mode == "INSERT":
            self.cx = max(0, min(self.cx, line_len))
        else:
            self.cx = max(0, min(self.cx, max(0, line_len - 1)))

    def save(self):
        if not self.filename:
            self.status_msg = "No filename! Use :w filename"
            return
        try:
            with open(self.filename, "w") as f:
                f.write("\n".join(self.lines))
            self.modified = False
            self.status_msg = f"Saved {self.filename} ({len(self.lines)} lines)"
        except Exception as e:
            self.status_msg = f"Error saving: {e}"

    def handle_command(self):
        cmd = self.command_buf.strip()
        if cmd == "q":
            if self.modified:
                self.status_msg = "Unsaved changes! Use :q! to force quit"
            else:
                return "quit"
        elif cmd == "q!":
            return "quit"
        elif cmd == "w":
            self.save()
        elif cmd.startswith("w "):
            self.filename = cmd[2:].strip()
            self.save()
        elif cmd == "wq" or cmd == "x":
            self.save()
            return "quit"
        else:
            self.status_msg = f"Unknown command: {cmd}"
        return None

    def handle_normal(self, key):
        line = self.lines[self.cy]

        if key == ord("i"):
            self.mode = "INSERT"
            self.status_msg = ""
        elif key == ord("I"):
            self.cx = 0
            self.mode = "INSERT"
        elif key == ord("a"):
            self.cx = min(self.cx + 1, len(line))
            self.mode = "INSERT"
        elif key == ord("A"):
            self.cx = len(line)
            self.mode = "INSERT"
        elif key == ord("o"):
            self.lines.insert(self.cy + 1, "")
            self.cy += 1
            self.cx = 0
            self.mode = "INSERT"
            self.modified = True
        elif key == ord("O"):
            self.lines.insert(self.cy, "")
            self.cx = 0
            self.mode = "INSERT"
            self.modified = True
        elif key == ord(":"):
            self.mode = "COMMAND"
            self.command_buf = ""
        elif key == ord("/"):
            self.mode = "SEARCH"
            self.command_buf = ""
        # Movement
        elif key in (ord("h"), curses.KEY_LEFT):
            self.cx = max(0, self.cx - 1)
        elif key in (ord("l"), curses.KEY_RIGHT):
            self.cx = min(len(line) - 1, self.cx + 1)
        elif key in (ord("k"), curses.KEY_UP):
            self.cy = max(0, self.cy - 1)
            self.clamp_cx()
        elif key in (ord("j"), curses.KEY_DOWN):
            self.cy = min(len(self.lines) - 1, self.cy + 1)
            self.clamp_cx()
        elif key == ord("0"):
            self.cx = 0
        elif key == ord("$"):
            self.cx = max(0, len(line) - 1)
        elif key == ord("g"):
            self.cy = 0
            self.cx = 0
        elif key == ord("G"):
            self.cy = len(self.lines) - 1
            self.clamp_cx()
        elif key == curses.KEY_PPAGE:  # page up
            self.cy = max(0, self.cy - 20)
            self.clamp_cx()
        elif key == curses.KEY_NPAGE:  # page down
            self.cy = min(len(self.lines) - 1, self.cy + 20)
            self.clamp_cx()
        # Delete
        elif key == ord("x"):
            if self.cx < len(line):
                self.lines[self.cy] = line[:self.cx] + line[self.cx+1:]
                self.modified = True
                self.clamp_cx()
        elif key == ord("d"):
            if len(self.lines) > 1:
                self.lines.pop(self.cy)
                self.cy = min(self.cy, len(self.lines) - 1)
                self.modified = True
                self.clamp_cx()
        # Word movement
        elif key == ord("w"):
            while self.cx < len(line) - 1 and line[self.cx] != " ":
                self.cx += 1
            while self.cx < len(line) - 1 and line[self.cx] == " ":
                self.cx += 1
        elif key == ord("b"):
            self.cx = max(0, self.cx - 1)
            while self.cx > 0 and line[self.cx] == " ":
                self.cx -= 1
            while self.cx > 0 and line[self.cx - 1] != " ":
                self.cx -= 1

    def handle_insert(self, key):
        if key == 27:  # Escape
            self.mode = "NORMAL"
            self.cx = max(0, self.cx - 1)
            self.clamp_cx()
            return
        elif key in (curses.KEY_BACKSPACE, 127, 8):
            if self.cx > 0:
                line = self.lines[self.cy]
                self.lines[self.cy] = line[:self.cx-1] + line[self.cx:]
                self.cx -= 1
                self.modified = True
            elif self.cy > 0:
                prev = self.lines[self.cy - 1]
                self.cx = len(prev)
                self.lines[self.cy - 1] = prev + self.lines[self.cy]
                self.lines.pop(self.cy)
                self.cy -= 1
                self.modified = True
        elif key == ord("\n") or key == curses.KEY_ENTER or key == 10:
            line = self.lines[self.cy]
            self.lines[self.cy] = line[:self.cx]
            self.lines.insert(self.cy + 1, line[self.cx:])
            self.cy += 1
            self.cx = 0
            self.modified = True
        elif key == curses.KEY_LEFT:
            self.cx = max(0, self.cx - 1)
        elif key == curses.KEY_RIGHT:
            self.cx = min(len(self.lines[self.cy]), self.cx + 1)
        elif key == curses.KEY_UP:
            self.cy = max(0, self.cy - 1)
            self.clamp_cx()
        elif key == curses.KEY_DOWN:
            self.cy = min(len(self.lines) - 1, self.cy + 1)
            self.clamp_cx()
        elif 32 <= key <= 126:
            line = self.lines[self.cy]
            self.lines[self.cy] = line[:self.cx] + chr(key) + line[self.cx:]
            self.cx += 1
            self.modified = True

    def handle_command_input(self, key):
        if key == 27:
            self.mode = "NORMAL"
            self.command_buf = ""
        elif key in (ord("\n"), 10, curses.KEY_ENTER):
            result = self.handle_command()
            self.mode = "NORMAL"
            self.command_buf = ""
            return result
        elif key in (curses.KEY_BACKSPACE, 127, 8):
            self.command_buf = self.command_buf[:-1]
            if not self.command_buf:
                self.mode = "NORMAL"
        elif 32 <= key <= 126:
            self.command_buf += chr(key)
        return None

    def handle_search_input(self, key):
        if key == 27:
            self.mode = "NORMAL"
            self.command_buf = ""
        elif key in (ord("\n"), 10, curses.KEY_ENTER):
            self.search_term = self.command_buf
            self.do_search()
            self.mode = "NORMAL"
            self.command_buf = ""
        elif key in (curses.KEY_BACKSPACE, 127, 8):
            self.command_buf = self.command_buf[:-1]
        elif 32 <= key <= 126:
            self.command_buf += chr(key)

    def do_search(self):
        if not self.search_term:
            return
        for i in range(self.cy, len(self.lines)):
            start = self.cx + 1 if i == self.cy else 0
            idx = self.lines[i].find(self.search_term, start)
            if idx != -1:
                self.cy = i
                self.cx = idx
                self.status_msg = f"/{self.search_term}"
                return
        self.status_msg = f"Pattern not found: {self.search_term}"

    def run(self, stdscr):
        self.setup_colors()
        curses.curs_set(1)
        stdscr.keypad(True)

        while True:
            h, w = stdscr.getmaxyx()
            self.scroll(h, w)
            self.draw(stdscr)
            stdscr.refresh()

            key = stdscr.getch()

            if self.mode == "NORMAL":
                self.handle_normal(key)
            elif self.mode == "INSERT":
                self.handle_insert(key)
            elif self.mode == "COMMAND":
                result = self.handle_command_input(key)
                if result == "quit":
                    break
            elif self.mode == "SEARCH":
                self.handle_search_input(key)


def main():
    filename = sys.argv[1] if len(sys.argv) > 1 else None
    editor = Editor(filename)
    curses.wrapper(editor.run)


if __name__ == "__main__":
    main()
