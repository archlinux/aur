#!/usr/bin/env python3

import curses
import json
import random
import time
from pathlib import Path
from datetime import datetime

# config stuff

SAVE_DIR = Path.home() / ".freeTask"
SAVE_FILE = SAVE_DIR / "save.json"
SETTINGS_FILE = SAVE_DIR / "settings.json"

FREE_TIME_PER_TASK = 45

# themes

THEMES = {
    "tardis": {
        "selected": (curses.COLOR_BLACK, curses.COLOR_CYAN),
        "border": (curses.COLOR_CYAN, -1),
        "title": (curses.COLOR_BLUE, -1),
        "clock": (curses.COLOR_YELLOW, -1),
        "done": (curses.COLOR_GREEN, -1),
        "particles": (curses.COLOR_BLUE, -1),
        "progress": (curses.COLOR_CYAN, -1),
        "particle_chars": ["·", "•", "◦", "°"],
        "subtitle": "<< TARDIS TERMINAL INTERFACE >>"
    },

    "matrix": {
        "selected": (curses.COLOR_BLACK, curses.COLOR_GREEN),
        "border": (curses.COLOR_GREEN, -1),
        "title": (curses.COLOR_GREEN, -1),
        "clock": (curses.COLOR_WHITE, -1),
        "done": (curses.COLOR_GREEN, -1),
        "particles": (curses.COLOR_GREEN, -1),
        "progress": (curses.COLOR_GREEN, -1),
        "particle_chars": ["1", "0", "|", ":"],
        "subtitle": "<< MATRIX NODE >>"
    },

    "amber": {
        "selected": (curses.COLOR_BLACK, curses.COLOR_YELLOW),
        "border": (curses.COLOR_YELLOW, -1),
        "title": (curses.COLOR_RED, -1),
        "clock": (curses.COLOR_YELLOW, -1),
        "done": (curses.COLOR_GREEN, -1),
        "particles": (curses.COLOR_YELLOW, -1),
        "progress": (curses.COLOR_RED, -1),
        "particle_chars": [".", "*", "+"],
        "subtitle": "<< AMBER CONSOLE ACTIVE >>"
    }
}

class Settings:
    def __init__(self):
        self.theme = "tardis"
        SAVE_DIR.mkdir(parents=True, exist_ok=True)
        self.load()
    def load(self):
        if not SETTINGS_FILE.exists():
            self.save()
            return
        try:
            with open(SETTINGS_FILE, "r") as f:
                data = json.load(f)
            self.theme = data.get("theme", "tardis")
        except Exception:
            self.theme = "tardis"
    def save(self):
        with open(SETTINGS_FILE, "w") as f:
            json.dump({
                "theme": self.theme
            }, f, indent=4)

class TaskManager:
    def __init__(self):
        self.tasks = []
        self.free_time_bank = 0.0
        self.last_tick = time.time()
        SAVE_DIR.mkdir(parents=True, exist_ok=True)
        self.load()

    def load(self):
        if not SAVE_FILE.exists():
            self.save()
            return
        try:
            with open(SAVE_FILE, "r") as f:
                data = json.load(f)

            self.tasks = data.get("tasks", [])
            self.free_time_bank = data.get("free_time_bank", 0.0)
        except Exception:
            self.tasks = []
            self.free_time_bank = 0.0
            self.save()

    def save(self):
        temp = SAVE_FILE.with_suffix(".tmp")
        with open(temp, "w") as f:
            json.dump({
                "tasks": self.tasks,
                "free_time_bank": self.free_time_bank
            }, f, indent=4)
        temp.replace(SAVE_FILE)

    def add_task(self, text):
        self.tasks.append({
            "task": text,
            "done": False,
            "rewarded": False
        })
        self.save()

    def toggle_task(self, index):
        if 0 <= index < len(self.tasks):
            task = self.tasks[index]
            if "rewarded" not in task:
                task["rewarded"] = False
            if not task["done"]:
                task["done"] = True
                if not task["rewarded"]:
                    self.free_time_bank += FREE_TIME_PER_TASK
                    task["rewarded"] = True
            else:
                task["done"] = False
            self.save()

    def delete_task(self, index):
        if 0 <= index < len(self.tasks):
            del self.tasks[index]
            self.save()

    def reset_bank(self):
        self.free_time_bank = 0.0
        self.save()

    def completed(self):
        return sum(1 for t in self.tasks if t["done"])

    def percent(self):
        if not self.tasks:
            return 0
        return int((self.completed() / len(self.tasks)) * 100)

    def tick(self):
        now = time.time()
        elapsed = now - self.last_tick
        self.last_tick = now
        if self.free_time_bank > 0:
            self.free_time_bank -= elapsed / 60
            if self.free_time_bank < 0:
                self.free_time_bank = 0

particles = []

def init_particles(width, height):
    global particles
    particles = []
    for _ in range(80):
        particles.append({
            "x": random.randint(0, width - 1),
            "y": random.randint(0, height - 1),
            "speed": random.uniform(0.02, 0.08)
        })

def update_particles(width, height, dt):
    for p in particles:
        p["y"] += p["speed"] * dt * 20
        if p["y"] >= height:
            p["y"] = 0
            p["x"] = random.randint(0, width - 1)

def draw_particles(stdscr, settings):
    theme = THEMES[settings.theme]
    chars = theme["particle_chars"]
    stdscr.attron(curses.color_pair(6))

    for p in particles:
        try:
            stdscr.addstr(
                int(p["y"]),
                int(p["x"]),
                random.choice(chars)
            )
        except:
            pass

    stdscr.attroff(curses.color_pair(6))

def center_x(width, text):
    return max(0, width // 2 - len(text) // 2)

def format_time(minutes):
    total_seconds = int(minutes * 60)

    h = total_seconds // 3600
    m = (total_seconds % 3600) // 60
    s = total_seconds % 60

    return f"{h:02}:{m:02}:{s:02}"

def apply_theme(settings):
    theme = THEMES[settings.theme]

    curses.init_pair(1, *theme["selected"])
    curses.init_pair(2, *theme["border"])
    curses.init_pair(3, *theme["title"])
    curses.init_pair(4, *theme["clock"])
    curses.init_pair(5, *theme["done"])
    curses.init_pair(6, *theme["particles"])
    curses.init_pair(7, *theme["progress"])

def draw_box(stdscr, y, x, h, w):
    stdscr.attron(curses.color_pair(2))

    stdscr.addstr(y, x, "◉" + "═" * (w - 2) + "◉")

    for i in range(1, h - 1):
        stdscr.addstr(y + i, x, "║")
        stdscr.addstr(y + i, x + w - 1, "║")

    stdscr.addstr(y + h - 1, x, "◉" + "═" * (w - 2) + "◉")

    stdscr.attroff(curses.color_pair(2))

def add_task_screen(stdscr, manager):
    curses.echo()
    curses.curs_set(1)

    stdscr.clear()

    h, w = stdscr.getmaxyx()

    box_w = 60
    box_h = 7

    x = w // 2 - box_w // 2
    y = h // 2 - box_h // 2

    draw_box(stdscr, y, x, box_h, box_w)

    title = "NEW TASK"

    stdscr.attron(curses.A_BOLD)
    stdscr.addstr(y + 1, center_x(w, title), title)
    stdscr.attroff(curses.A_BOLD)

    prompt = "ENTER TASK: "

    stdscr.addstr(y + 3, x + 3, prompt)

    stdscr.refresh()

    try:
        task = stdscr.getstr(
            y + 3,
            x + 3 + len(prompt),
            40
        ).decode("utf-8").strip()
    except:
        task = ""

    if task:
        manager.add_task(task)

    curses.noecho()
    curses.curs_set(0)

def settings_menu(stdscr, settings):
    options = list(THEMES.keys())

    selected = options.index(settings.theme)

    while True:
        stdscr.erase()
        h, w = stdscr.getmaxyx()

        title = "SETTINGS"
        stdscr.attron(curses.A_BOLD)
        stdscr.addstr(2, center_x(w, title), title)
        stdscr.attroff(curses.A_BOLD)

        for idx, option in enumerate(options):
            y = 6 + idx

            if idx == selected:
                stdscr.attron(curses.color_pair(1))

            stdscr.addstr(
                y,
                center_x(w, option.upper()),
                option.upper()
            )

            stdscr.attroff(curses.color_pair(1))

        footer = "[ENTER] APPLY   [Q] BACK"
        stdscr.addstr(
            h - 2,
            center_x(w, footer),
            footer
        )

        stdscr.refresh()

        key = stdscr.getch()

        if key == curses.KEY_UP:
            selected -= 1
        elif key == curses.KEY_DOWN:
            selected += 1
        elif key in (10, 13):
            settings.theme = options[selected]
            settings.save()
            apply_theme(settings)
            return
        elif key in (ord("q"), ord("Q")):
            return

        selected = max(0, min(selected, len(options) - 1))

def draw_ui(stdscr, manager, settings, selected):
    stdscr.erase()
    h, w = stdscr.getmaxyx()

    dt = getattr(draw_ui, "last", time.time())
    now_t = time.time()
    frame_dt = now_t - dt
    draw_ui.last = now_t

    update_particles(w, h, frame_dt)

    draw_particles(stdscr, settings)
    theme = THEMES[settings.theme]

    header = "TASK TERMINAL"
    stdscr.attron(curses.color_pair(3) | curses.A_BOLD)
    stdscr.addstr(1, center_x(w, header), header)
    stdscr.attroff(curses.color_pair(3) | curses.A_BOLD)

    subtitle = theme["subtitle"]
    stdscr.attron(curses.color_pair(6))
    stdscr.addstr(2, center_x(w, subtitle), subtitle)
    stdscr.attroff(curses.color_pair(6))

    draw_box(stdscr, 4, 2, 8, w - 4)
    draw_box(stdscr, 13, 2, h - 17, w - 4)

    now = datetime.now().strftime("%H:%M:%S")
    stdscr.attron(curses.color_pair(4))
    stdscr.addstr(6, 5, f"CLOCK          : {now}")
    stdscr.addstr(7, 5, f"TEMPORAL BANK  : {format_time(manager.free_time_bank)}")
    stdscr.attroff(curses.color_pair(4))

    percent = manager.percent()
    bar_w = 36
    filled = int(bar_w * percent / 100)
    bar = "█" * filled + "░" * (bar_w - filled)

    stdscr.attron(curses.color_pair(7))
    stdscr.addstr(9, 5, f"TASK PROGRESS  : [{bar}] {percent}%")
    stdscr.attroff(curses.color_pair(7))

    stdscr.attron(curses.color_pair(3) | curses.A_BOLD)
    stdscr.addstr(14, 5, "ACTIVE TASKS")
    stdscr.attroff(curses.color_pair(3) | curses.A_BOLD)

    if not manager.tasks:
        stdscr.addstr(16, 7, "No active tasks.")

    for idx, task in enumerate(manager.tasks):
        prefix = "◆" if task["done"] else "◇"
        arrow = "> " if idx == selected else "  "
        line = f"{arrow}{prefix} {task['task']}"

        y = 16 + idx

        if y >= h - 4:
            break

        if idx == selected:
            stdscr.attron(curses.color_pair(1))
        elif task["done"]:
            stdscr.attron(curses.color_pair(5))

        try:
            stdscr.addstr(y, 7, line[:w - 14])
        except:
            pass

        stdscr.attroff(curses.color_pair(1))
        stdscr.attroff(curses.color_pair(5))

    footer = "[A] ADD  [SPACE] COMPLETE  [D] DELETE  [S] SETTINGS  [R] RESET BANK  [Q] QUIT"
    stdscr.attron(curses.color_pair(2) | curses.A_BOLD)
    stdscr.addstr(h - 2, center_x(w, footer), footer)
    stdscr.attroff(curses.color_pair(2) | curses.A_BOLD)

    stdscr.refresh()

def main(stdscr):

    curses.curs_set(0)
    curses.start_color()
    curses.use_default_colors()

    settings = Settings()
    apply_theme(settings)

    stdscr.nodelay(True)
    stdscr.timeout(100)

    h, w = stdscr.getmaxyx()
    init_particles(w, h)

    manager = TaskManager()
    selected = 0

    while True:

        manager.tick()

        if manager.tasks:
            selected = max(0, min(selected, len(manager.tasks) - 1))
        else:
            selected = 0

        draw_ui(stdscr, manager, settings, selected)

        key = stdscr.getch()

        if key == -1:
            continue
        elif key == curses.KEY_UP:
            selected -= 1
        elif key == curses.KEY_DOWN:
            selected += 1
        elif key == ord(" "):
            manager.toggle_task(selected)
        elif key in (ord("a"), ord("A")):
            stdscr.nodelay(False)
            add_task_screen(stdscr, manager)
            stdscr.nodelay(True)
            draw_ui.last = time.time()
        elif key in (ord("d"), ord("D")):
            manager.delete_task(selected)
        elif key in (ord("s"), ord("S")):
            stdscr.nodelay(False)
            settings_menu(stdscr, settings)
            stdscr.nodelay(True)
            draw_ui.last = time.time()
        elif key in (ord("r"), ord("R")):
            manager.reset_bank()
        elif key in (ord("q"), ord("Q")):
            break

if __name__ == "__main__":
    curses.wrapper(main)
