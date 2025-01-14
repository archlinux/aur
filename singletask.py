#!/usr/bin/env python3
import tkinter as tk
from tkinter import ttk
import sqlite3
import time
import json
import os

class SingleTaskApp:
    STATE_FILE = "app_state.json"

    def __init__(self, root):
        self.root = root
        self.root.title("SingleTask")
        self.root.geometry("350x350")

        # Initialize SQLite database
        self.conn = sqlite3.connect("tasks.db")
        self.cursor = self.conn.cursor()
        self.create_database()

        # Navbar setup
        self.navbar = ttk.Notebook(root)
        self.navbar.pack(fill=tk.BOTH, expand=True)

        # Tabs
        self.current_task_tab = ttk.Frame(self.navbar)
        self.tasks_tab = ttk.Frame(self.navbar)
        self.capture_tab = ttk.Frame(self.navbar)
        self.visualizer_tab = ttk.Frame(self.navbar)

        self.navbar.add(self.current_task_tab, text="Current Task")
        self.navbar.add(self.tasks_tab, text="Tasks")
        self.navbar.add(self.capture_tab, text="Capture")
        self.navbar.add(self.visualizer_tab, text="Captured Thoughts")

        self.setup_current_task_tab()
        self.setup_tasks_tab()
        self.setup_capture_tab()
        self.setup_visualizer_tab()

        self.current_task_start_time = None
        self.current_task_hours = 0.0

        # Load state if exists
        self.load_state()

    def create_database(self):
        self.cursor.execute("""
            CREATE TABLE IF NOT EXISTS captures (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                content TEXT NOT NULL
            )
        """)
        self.cursor.execute("""
            CREATE TABLE IF NOT EXISTS task_timer (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                task TEXT NOT NULL,
                hours REAL DEFAULT 0
            )
        """)
        self.conn.commit()

    def setup_current_task_tab(self):
        # Current Task Tab
        self.current_task_label = ttk.Label(self.current_task_tab, text="Current Task:", font=("Arial", 20, "bold"))
        self.current_task_label.pack(pady=20)

        self.current_task_title = ttk.Label(self.current_task_tab, text="No task selected", font=("Arial", 18), foreground="blue")
        self.current_task_title.pack(pady=10)

        self.timer_frame = ttk.Frame(self.current_task_tab)
        self.timer_frame.pack(pady=20)

        self.timer_label = ttk.Label(self.timer_frame, text="Hours spent: 0.0", font=("Arial", 16))
        self.timer_label.pack(side=tk.LEFT, padx=10)

        self.timer_status = tk.Label(self.timer_frame, width=2, height=1, bg="red")
        self.timer_status.pack(side=tk.LEFT, padx=10)

        self.start_button = ttk.Button(self.current_task_tab, text="Start Timer", command=self.start_timer)
        self.start_button.pack(pady=10)

        self.stop_button = ttk.Button(self.current_task_tab, text="Stop Timer", command=self.stop_timer)
        self.stop_button.pack(pady=10)

    def start_timer(self):
        if not self.current_task_start_time:
            self.current_task_start_time = time.time()
            self.timer_status.config(bg="green")

    def stop_timer(self):
        if self.current_task_start_time:
            elapsed_time = (time.time() - self.current_task_start_time) / 3600
            self.current_task_hours += elapsed_time
            self.timer_label.config(text=f"Hours spent: {self.current_task_hours:.2f}")
            self.current_task_start_time = None
            self.timer_status.config(bg="red")

            task_name = self.current_task_title.cget("text")
            if task_name != "No task selected":
                self.cursor.execute("INSERT INTO task_timer (task, hours) VALUES (?, ?)", (task_name, self.current_task_hours))
                self.conn.commit()

    def setup_tasks_tab(self):
        # Tasks Tab
        self.tasks_text = tk.Text(self.tasks_tab, wrap=tk.WORD, height=10)
        self.tasks_text.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

        # Add a button to set the first line as the current task
        self.update_task_button = ttk.Button(self.tasks_tab, text="Set Current Task", command=self.set_current_task)
        self.update_task_button.pack(pady=10)

    def set_current_task(self):
        # Get the first line from tasks_text
        first_line = self.tasks_text.get("1.0", "2.0").strip()
        if first_line:
            self.current_task_title.config(text=first_line)
            self.current_task_hours = 0.0  # Reset hours for the new task
            self.timer_label.config(text="Hours spent: 0.0")
        else:
            self.current_task_title.config(text="No task selected")

    def setup_capture_tab(self):
        # Capture Tab
        self.capture_label = ttk.Label(self.capture_tab, text="Capture Your Thoughts:", font=("Arial", 16))
        self.capture_label.pack(pady=10)

        self.capture_entry = tk.Text(self.capture_tab, wrap=tk.WORD, height=10)
        self.capture_entry.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

        self.save_button = ttk.Button(self.capture_tab, text="Save", command=self.save_capture)
        self.save_button.pack(pady=10)

    def save_capture(self):
        content = self.capture_entry.get("1.0", tk.END).strip()
        if content:
            self.cursor.execute("INSERT INTO captures (content) VALUES (?)", (content,))
            self.conn.commit()
            self.capture_entry.delete("1.0", tk.END)
            self.update_visualizer()

    def setup_visualizer_tab(self):
        # Captured Thoughts Tab
        self.visualizer_label = ttk.Label(self.visualizer_tab, text="Captured Thoughts:", font=("Arial", 16))
        self.visualizer_label.pack(pady=10)

        self.visualizer_listbox = tk.Listbox(self.visualizer_tab, height=10)
        self.visualizer_listbox.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

        self.action_frame = ttk.Frame(self.visualizer_tab)
        self.action_frame.pack(pady=10)

        self.delete_button = ttk.Button(self.action_frame, text="Delete", command=self.delete_selected_thought)
        self.delete_button.pack(side=tk.LEFT, padx=5)

        self.copy_button = ttk.Button(self.action_frame, text="Copy", command=self.copy_selected_thought)
        self.copy_button.pack(side=tk.LEFT, padx=5)

        self.update_visualizer()

    def update_visualizer(self):
        # Update the listbox with captured thoughts
        self.visualizer_listbox.delete(0, tk.END)
        self.cursor.execute("SELECT id, content FROM captures")
        thoughts = self.cursor.fetchall()
        for thought in thoughts:
            self.visualizer_listbox.insert(tk.END, f"{thought[0]}: {thought[1]}")

    def delete_selected_thought(self):
        selected = self.visualizer_listbox.curselection()
        if selected:
            thought_id = int(self.visualizer_listbox.get(selected[0]).split(":")[0])
            self.cursor.execute("DELETE FROM captures WHERE id = ?", (thought_id,))
            self.conn.commit()
            self.update_visualizer()

    def copy_selected_thought(self):
        selected = self.visualizer_listbox.curselection()
        if selected:
            thought_text = self.visualizer_listbox.get(selected[0]).split(": ", 1)[1]
            self.root.clipboard_clear()
            self.root.clipboard_append(thought_text)

    def save_state(self):
        state = {
            "current_task_title": self.current_task_title.cget("text"),
            "current_task_hours": self.current_task_hours,
            "tasks_text": self.tasks_text.get("1.0", tk.END).strip(),
        }
        with open(self.STATE_FILE, "w") as f:
            json.dump(state, f)

    def load_state(self):
        if os.path.exists(self.STATE_FILE):
            with open(self.STATE_FILE, "r") as f:
                state = json.load(f)
            self.current_task_title.config(text=state.get("current_task_title", "No task selected"))
            self.current_task_hours = state.get("current_task_hours", 0.0)
            self.timer_label.config(text=f"Hours spent: {self.current_task_hours:.2f}")
            self.tasks_text.insert("1.0", state.get("tasks_text", ""))

    def on_close(self):
        self.save_state()
        self.conn.close()
        self.root.destroy()

if __name__ == "__main__":
    root = tk.Tk()
    app = SingleTaskApp(root)
    root.protocol("WM_DELETE_WINDOW", app.on_close)
    root.mainloop()
