import turtle
import random
import math
import tkinter as tk
import colorsys
import logging
import uuid
from datetime import datetime
from logging.handlers import RotatingFileHandler

# -----------------------
# LOGGING
# -----------------------
log_filename = f"iastfyp_turtle_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
handler = RotatingFileHandler(log_filename, maxBytes=5 * 1024 * 1024, backupCount=2)
handler.setFormatter(logging.Formatter("%(asctime)s [%(levelname)s] %(message)s", datefmt="%H:%M:%S"))
log = logging.getLogger()
log.setLevel(logging.DEBUG)
log.addHandler(handler)
log.info("IaSTFyP started")

# -----------------------
# TK ROOT
# -----------------------
root = tk.Tk()
root.title("IaSTFyP Controller")

# -----------------------
# CONFIG STORAGE
# -----------------------
MODE = None

config = {
    "MAX_TURTLES": 35,
    "MIN_SPEED": 35,
    "MAX_SPEED": 50,
    "REPRO_CHANCE": 0.3,
    "DEATH_CHANCE": 0.01,
    "MEET_DISTANCE": 10
}

# -----------------------
# MODE SELECT MENU
# -----------------------
def select_mode():
    global MODE

    win = tk.Toplevel(root)
    win.title("Select Mode")
    win.geometry("300x300")

    tk.Label(win, text="Choose Mode", font=("Arial", 14, "bold")).pack(pady=10)

    def set_mode(m):
        global MODE
        MODE = m
        win.destroy()

    tk.Button(win, text="supah_ez", command=lambda: set_mode("supah_ez")).pack(fill="x", padx=20, pady=5)
    tk.Button(win, text="easy", command=lambda: set_mode("easy")).pack(fill="x", padx=20, pady=5)
    tk.Button(win, text="normal", command=lambda: set_mode("normal")).pack(fill="x", padx=20, pady=5)
    tk.Button(win, text="extreme", command=lambda: set_mode("extreme")).pack(fill="x", padx=20, pady=5)
    tk.Button(win, text="custom", command=lambda: set_mode("custom")).pack(fill="x", padx=20, pady=5)

    win.transient(root)
    win.grab_set()
    root.wait_window(win)

# -----------------------
# CUSTOM CONFIG MENU
# -----------------------
def custom_menu():
    win = tk.Toplevel(root)
    win.title("Custom Settings")
    win.geometry("350x400")

    entries = {}

    tk.Label(win, text="Edit Simulation Parameters", font=("Arial", 12, "bold")).pack(pady=10)

    def add_field(name):
        frame = tk.Frame(win)
        frame.pack(fill="x", padx=10, pady=3)
        tk.Label(frame, text=name, width=18, anchor="w").pack(side="left")
        e = tk.Entry(frame)
        e.insert(0, str(config[name]))
        e.pack(side="right", fill="x", expand=True)
        entries[name] = e

    for key in config:
        add_field(key)

    def apply():
        try:
            config["MAX_TURTLES"] = int(entries["MAX_TURTLES"].get())
            config["MIN_SPEED"] = int(entries["MIN_SPEED"].get())
            config["MAX_SPEED"] = int(entries["MAX_SPEED"].get())
            config["REPRO_CHANCE"] = float(entries["REPRO_CHANCE"].get())
            config["DEATH_CHANCE"] = float(entries["DEATH_CHANCE"].get())
            config["MEET_DISTANCE"] = int(entries["MEET_DISTANCE"].get())
        except ValueError:
            print("Invalid input — expected numbers.")
            return
        win.destroy()

    tk.Button(win, text="Start Simulation", command=apply).pack(pady=10)

    win.transient(root)
    win.grab_set()
    root.wait_window(win)

# -----------------------
# START UI FLOW
# -----------------------
select_mode()

if MODE is None:
    raise SystemExit("No mode selected")

if MODE == "supah_ez":
    config.update({
        "MAX_TURTLES": 10,
        "MIN_SPEED": 7,
        "MAX_SPEED": 10,
        "REPRO_CHANCE": 0.2,
        "DEATH_CHANCE": 0.002,
        "MEET_DISTANCE": 20
    })
elif MODE == "easy":
    config.update({
        "MAX_TURTLES": 15,
        "MIN_SPEED": 13,
        "MAX_SPEED": 15,
        "REPRO_CHANCE": 0.3,
        "DEATH_CHANCE": 0.001,
        "MEET_DISTANCE": 25
    })
elif MODE == "normal":
    config.update({
        "MAX_TURTLES": 50,
        "MIN_SPEED": 20,
        "MAX_SPEED": 30,
        "REPRO_CHANCE": 0.4,
        "DEATH_CHANCE": 0.0003,
        "MEET_DISTANCE": 30
    })
elif MODE == "extreme":
    config.update({
        "MAX_TURTLES": 5000,
        "MIN_SPEED": 100,
        "MAX_SPEED": 100,
        "REPRO_CHANCE": 1.0,
        "DEATH_CHANCE": 0.000001,
        "MEET_DISTANCE": 100
    })
elif MODE == "custom":
    custom_menu()

log.info(f"Mode: {MODE}")
log.info(f"Config: {config}")

# -----------------------
# TURTLE SETUP
# -----------------------
screen = turtle.Screen()
screen.tracer(0)
screen.colormode(1.0)

# Query actual screen bounds
BOUND_X = screen.window_width() // 2 - 10
BOUND_Y = screen.window_height() // 2 - 10

# TurtleEntity wraps turtle + stable UUID-keyed age
class TurtleEntity:
    def __init__(self):
        self.uid = uuid.uuid4()
        self.age = 0
        self.t = turtle.Turtle()
        self.t.shape("circle")
        self.t.speed(0)
        self.t.penup()
        self.t.goto(random.randint(-BOUND_X, BOUND_X), random.randint(-BOUND_Y, BOUND_Y))
        self.t.setheading(random.randint(0, 360))
        self.t.pendown()

    def destroy(self):
        self.t.hideturtle()
        self.t.clear()

    def xcor(self):
        return self.t.xcor()

    def ycor(self):
        return self.t.ycor()

def age_color(age):
    hue = (age % 300) / 300.0
    return colorsys.hsv_to_rgb(hue, 1.0, 1.0)

def distance(a, b):
    return math.hypot(a.xcor() - b.xcor(), a.ycor() - b.ycor())

# Spatial grid for O(n) proximity checks instead of O(n²)
class SpatialGrid:
    def __init__(self, cell_size):
        self.cell_size = cell_size
        self.grid = {}

    def _cell(self, x, y):
        return int(x // self.cell_size), int(y // self.cell_size)

    def build(self, entities):
        self.grid = {}
        for e in entities:
            c = self._cell(e.xcor(), e.ycor())
            self.grid.setdefault(c, []).append(e)

    def neighbors(self, e):
        cx, cy = self._cell(e.xcor(), e.ycor())
        result = []
        for dx in (-1, 0, 1):
            for dy in (-1, 0, 1):
                result.extend(self.grid.get((cx + dx, cy + dy), []))
        return result

turtles = []
pending_kills = 0
paused = False

for _ in range(2):
    turtles.append(TurtleEntity())

# -----------------------
# CONTROL UI
# -----------------------
btn_frame = tk.Frame(root)
btn_frame.pack()

def add_turtle():
    if len(turtles) < config["MAX_TURTLES"]:
        turtles.append(TurtleEntity())

def kill_turtle():
    global pending_kills
    pending_kills += 1

def toggle_pause():
    global paused
    paused = not paused
    pause_btn.config(text="Resume" if paused else "Pause")

tk.Button(btn_frame, text="Add", command=add_turtle).pack(side="left")
tk.Button(btn_frame, text="Kill", command=kill_turtle).pack(side="left")
pause_btn = tk.Button(btn_frame, text="Pause", command=toggle_pause)
pause_btn.pack(side="left")

pop_label = tk.Label(root, text="Population: 2")
pop_label.pack()

# -----------------------
# SIM LOOP
# -----------------------
grid = SpatialGrid(config["MEET_DISTANCE"])

def step():
    global turtles, pending_kills

    if paused:
        root.after(50, step)
        return

    alive = []
    new_turtles = []

    for e in turtles:
        t = e.t

        if abs(t.xcor()) > BOUND_X or abs(t.ycor()) > BOUND_Y:
            t.setheading(t.towards(0, 0))
            t.forward(20)

        t.forward(random.randint(config["MIN_SPEED"], config["MAX_SPEED"]))
        t.right(random.randint(-30, 30))

        e.age += 1
        t.color(age_color(e.age))

        if random.random() < config["DEATH_CHANCE"]:
            e.destroy()
        else:
            alive.append(e)

    turtles[:] = alive

    # O(n) reproduction via spatial grid
    grid.build(turtles)
    seen_pairs = set()
    for e in turtles:
        if len(turtles) + len(new_turtles) >= config["MAX_TURTLES"]:
            break
        for neighbor in grid.neighbors(e):
            if neighbor is e:
                continue
            pair = frozenset((id(e), id(neighbor)))
            if pair in seen_pairs:
                continue
            seen_pairs.add(pair)
            if distance(e, neighbor) < config["MEET_DISTANCE"]:
                if len(turtles) + len(new_turtles) < config["MAX_TURTLES"]:
                    if random.random() < config["REPRO_CHANCE"]:
                        new_turtles.append(TurtleEntity())

    turtles.extend(new_turtles)

    # kills — snapshot pending_kills atomically
    kills = pending_kills
    pending_kills = 0
    for _ in range(kills):
        if turtles:
            e = turtles.pop(random.randrange(len(turtles)))
            e.destroy()

    pop_label.config(text=f"Population: {len(turtles)}")
    screen.update()
    root.after(50, step)

# -----------------------
# START
# -----------------------
step()
root.mainloop()
