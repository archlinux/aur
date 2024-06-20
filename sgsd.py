#!/usr/bin/env python3

import tkinter as tk
import os

window = tk.Tk()

# Get screen dimensions
screen_width = window.winfo_screenwidth()
screen_height = window.winfo_screenheight()

# Calculate window position to center it
x_position = (screen_width - 600) // 2
y_position = (screen_height - 105) // 2

def countdown_window(action, seconds):
    countdown_window = tk.Toplevel()
    countdown_window.title("Countdown")
    countdown_window.geometry(f"600x105+{x_position}+{y_position}")
    countdown_window.wm_attributes("-topmost", 1)
    countdown_window.resizable(False, False)

    label = tk.Label(countdown_window, text=f"{action} in {seconds} seconds...", font=("Arial", 12))
    label.pack(pady=35)

    def on_key(event):
        if event.keysym == "Escape":
            countdown_window.destroy()
        elif event.keysym == "Return":
            countdown_window.destroy()
            execute_action(action)

    countdown_window.bind("<KeyPress>", on_key)

    def update_countdown():
        nonlocal seconds
        if seconds >= 0:
            label.config(text=f"{action} in {seconds} seconds...")
            countdown_window.after(1000, update_countdown)
            seconds -= 1
        else:
            countdown_window.destroy()
            execute_action(action)

    update_countdown()

def execute_action(action):
    if action == "Shutdown":
        os.system("poweroff")
    elif action == "Restart":
        os.system("reboot")
    elif action == "Logout":
        os.system("loginctl terminate-user $USER")

def show_window():
    def on_key(event):
        if event.keysym == "Escape":
            window.destroy()
        elif event.keysym == "s":
            countdown_window("Shutdown", 5)
        elif event.keysym == "r":
            countdown_window("Restart", 5)
        elif event.keysym == "l":
            countdown_window("Logout", 5)

    
    window.title("Power Menu")
    width = 12
    height = 105

    window.geometry(f"600x105+{x_position}+{y_position}")
    window.wm_attributes("-topmost", 1)  # Ensure the window is on top
    window.resizable(False, False)  # Make the window non-resizable

    window.bind("<KeyPress>", on_key)  # Bind the on_key function to key press events

    # Unicode icons
    icon_shutdown = "󰐥"  
    icon_restart = ""  
    icon_logout = "󰍂"  

    # Buttons with icons and fixed dimensions
    button_shutdown = tk.Button(window, text=icon_shutdown, command=lambda: countdown_window("Shutdown", 5), width=width, height=height)
    button_restart = tk.Button(window, text=icon_restart, command=lambda: countdown_window("Restart", 5), width=width, height=height)
    button_logout = tk.Button(window, text=icon_logout, command=lambda: countdown_window("Logout", 5), width=width, height=height)

    # Apply styles to the buttons
    button_shutdown.configure(bg="#e74c3c", fg="white", font=("Arial", 20), relief=tk.FLAT)
    button_restart.configure(bg="#2ecc71", fg="white", font=("Arial", 20), relief=tk.FLAT)
    button_logout.configure(bg="#3498db", fg="white", font=("Arial", 20), relief=tk.FLAT)

    # Show buttons in a line
    button_restart.pack(side="left")
    button_shutdown.pack(side="left")
    button_logout.pack(side="left")

    window.mainloop()

show_window()
