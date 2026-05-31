import turtle
import random
import math
import tkinter as tk
import colorsys
import logging
from datetime import datetime

# -----------------------
# LOGGING
# -----------------------
log_filename = f"iastfyp_turtle_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
logging.basicConfig(
    filename=log_filename,
    level=logging.DEBUG,
    format="%(asctime)s [%(levelname)s] %(message)s",
    datefmt="%H:%M:%S"
)
log = logging.getLogger()
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
        except:
            print("Invalid input!")
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

# preset modes
if MODE == "supah_ez":
    config.update({
        "MAX_TURTLES": 10,
        "MIN_SPEED": 3,
        "MAX_SPEED": 10,
        "REPRO_CHANCE": 0.1,
        "DEATH_CHANCE": 0.3,
        "MEET_DISTANCE": 5
    })

elif MODE == "easy":
    config.update({
        "MAX_TURTLES": 15,
        "MIN_SPEED": 10,
        "MAX_SPEED": 15,
        "REPRO_CHANCE": 0.3,
        "DEATH_CHANCE": 0.2,
        "MEET_DISTANCE": 10
    })

elif MODE == "normal":
    config.update({
        "MAX_TURTLES": 50,
        "MIN_SPEED": 20,
        "MAX_SPEED": 30,
        "REPRO_CHANCE": 0.4,
        "DEATH_CHANCE": 0.3,
        "MEET_DISTANCE": 25
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

turtles = []
ages = {}
pending_kills = 0
paused = False
frame = 0

def age_color(age):
    hue = (age % 300) / 300.0
    return colorsys.hsv_to_rgb(hue, 1.0, 1.0)

def create_turtle():
    t = turtle.Turtle()
    t.shape("circle")
    t.speed(0)
    t.penup()
    t.goto(random.randint(-300, 300), random.randint(-300, 300))
    t.setheading(random.randint(0, 360))
    t.pendown()
    ages[id(t)] = 0
    return t

def distance(a, b):
    return math.hypot(a.xcor() - b.xcor(), a.ycor() - b.ycor())

# initial spawn
for _ in range(2):
    turtles.append(create_turtle())

# -----------------------
# CONTROL UI
# -----------------------
btn_frame = tk.Frame(root)
btn_frame.pack()

def add_turtle():
    if len(turtles) < config["MAX_TURTLES"]:
        turtles.append(create_turtle())

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
def step():
    global turtles, pending_kills, frame

    if paused:
        root.after(50, step)
        return

    frame += 1
    alive = []
    new_turtles = []

    for t in turtles:
        if abs(t.xcor()) > 300 or abs(t.ycor()) > 300:
            t.setheading(t.towards(0, 0))
            t.forward(20)

        t.forward(random.randint(config["MIN_SPEED"], config["MAX_SPEED"]))
        t.right(random.randint(-30, 30))

        ages[id(t)] += 1
        t.color(age_color(ages[id(t)]))

        if random.random() < config["DEATH_CHANCE"]:
            t.hideturtle()
            t.clear()
            ages.pop(id(t), None)
        else:
            alive.append(t)

    turtles[:] = alive

    # reproduction
    for i in range(len(turtles)):
        for j in range(i + 1, len(turtles)):
            if distance(turtles[i], turtles[j]) < config["MEET_DISTANCE"]:
                if len(turtles) + len(new_turtles) < config["MAX_TURTLES"]:
                    if random.random() < config["REPRO_CHANCE"]:
                        new_turtles.append(create_turtle())

    turtles.extend(new_turtles)

    # kills
    for _ in range(pending_kills):
        if turtles:
            t = turtles.pop(random.randrange(len(turtles)))
            t.hideturtle()
            t.clear()
    pending_kills = 0

    pop_label.config(text=f"Population: {len(turtles)}")

    screen.update()
    root.after(50, step)

# -----------------------
# START
# -----------------------
step()
root.mainloop()
