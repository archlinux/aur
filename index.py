#!/usr/bin/env python3
import tkinter as tk
from PIL import Image, ImageTk
import subprocess
import threading
import time
import os

# Глобальные
current_image = None
drag_start = None
action_queue = []
stop_event = threading.Event()

# Пути
SCREENSHOT_PATH_PHONE = "/sdcard/adb_screen.png"
SCREENSHOT_PATH_LOCAL = "adb_screen.png"
UPDATE_INTERVAL = 0.5

def run_adb_command(cmd):
    try:
        result = subprocess.run(['adb'] + cmd, capture_output=True, text=True, timeout=5)
        return result.returncode == 0
    except:
        return False

def screenshot_worker():
    while not stop_event.is_set():
        if run_adb_command(['shell', 'screencap', '-p', SCREENSHOT_PATH_PHONE]):
            if run_adb_command(['pull', SCREENSHOT_PATH_PHONE, SCREENSHOT_PATH_LOCAL]):
                if os.path.exists(SCREENSHOT_PATH_LOCAL):
                    update_image()
        time.sleep(UPDATE_INTERVAL)

def send_actions():
    while not stop_event.is_set():
        if action_queue:
            action = action_queue.pop(0)
            if action[0] == 'tap':
                _, x, y = action
                run_adb_command(['shell', 'input', 'tap', str(x), str(y)])
                print(f"✅ tap {x} {y}")
            elif action[0] == 'swipe':
                _, x1, y1, x2, y2 = action
                run_adb_command(['shell', 'input', 'swipe', str(x1), str(y1), str(x2), str(y2), '300'])
                print(f"✅ swipe ({x1},{y1}) → ({x2},{y2})")
        time.sleep(0.1)

def update_image():
    global current_image
    try:
        img = Image.open(SCREENSHOT_PATH_LOCAL)
        max_width, max_height = 800, 1200
        img.thumbnail((max_width, max_height), Image.Resampling.LANCZOS)
        current_image = ImageTk.PhotoImage(img)
        canvas.config(width=img.width, height=img.height)
        canvas.create_image(0, 0, anchor=tk.NW, image=current_image)
    except Exception as e:
        print(f"❌ Ошибка загрузки изображения: {e}")

def on_click(event):
    x, y = event.x, event.y
    orig_w, orig_h = get_original_size()
    scaled_w = canvas.winfo_width()
    scaled_h = canvas.winfo_height()
    if scaled_w == 1 or scaled_h == 1:
        return
    ratio_x = orig_w / scaled_w
    ratio_y = orig_h / scaled_h
    real_x = int(x * ratio_x)
    real_y = int(y * ratio_y)
    action_queue.append(('tap', real_x, real_y))

def on_drag_start(event):
    global drag_start
    drag_start = (event.x, event.y)

def on_drag_end(event):
    global drag_start
    if drag_start is None:
        return
    x1, y1 = drag_start
    x2, y2 = event.x, event.y
    if abs(x2 - x1) < 5 and abs(y2 - y1) < 5:
        drag_start = None
        return  
    orig_w, orig_h = get_original_size()
    scaled_w = canvas.winfo_width()
    scaled_h = canvas.winfo_height()
    if scaled_w == 1 or scaled_h == 1:
        drag_start = None
        return
    ratio_x = orig_w / scaled_w
    ratio_y = orig_h / scaled_h
    real_x1 = int(x1 * ratio_x)
    real_y1 = int(y1 * ratio_y)
    real_x2 = int(x2 * ratio_x)
    real_y2 = int(y2 * ratio_y)
    action_queue.append(('swipe', real_x1, real_y1, real_x2, real_y2))
    drag_start = None

def get_original_size():
    
    try:
        result = subprocess.run(['adb', 'shell', 'wm', 'size'], capture_output=True, text=True)
        if 'Physical size:' in result.stdout:
            line = [l for l in result.stdout.split('\n') if 'Physical size:' in l][0]
            size = line.split(': ')[1].strip()  
            w, h = map(int, size.split('x'))
            return w, h
        else:
            img = Image.open(SCREENSHOT_PATH_LOCAL)
            return img.size
    except:
        return 1080, 1920 

# === GUI ===
screen_size = subprocess.run(['adb', 'shell', 'wm', 'size'], capture_output=True, text=True)
screen_line = [l for l in screen_size.stdout.split('\n') if 'Physical size:' in l][0]
screen = screen_line.split(': ')[1].strip()  
root = tk.Tk()
root.title("A4SC — ЛКМ: клик, ПКМ+перетащи: свайп")
root.geometry(screen)

canvas = tk.Canvas(root, bg="black")
canvas.pack(fill=tk.BOTH, expand=True)

canvas.bind("<Button-1>", on_click)              # Левый клик → tap
canvas.bind("<Button-3>", on_drag_start)         # Правый клик → начало свайпа
canvas.bind("<ButtonRelease-3>", on_drag_end)    # Отпускание → конец свайпа

# === Запуск потоков ===
threading.Thread(target=screenshot_worker, daemon=True).start()
threading.Thread(target=send_actions, daemon=True).start()

print("📱 Подключение к Android через ADB...")
if not subprocess.run(['adb', 'devices'], capture_output=True).returncode == 0:
    print("❌ ADB не найден")
    exit(1)
    
print("🖼️ Ожидание первого скриншота...")
time.sleep(2)

root.mainloop()

# Завершение
stop_event.set()
if os.path.exists(SCREENSHOT_PATH_LOCAL):
    os.remove(SCREENSHOT_PATH_LOCAL)