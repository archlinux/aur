import tkinter as tk
from tkinter import ttk, scrolledtext, messagebox
import os
import sys
import subprocess
import platform
import threading
import time
import queue
import shutil
from pathlib import Path

# Get user-writable data directory
USER_DATA_DIR = Path(os.path.expanduser("~/.local/share/broslauncher"))
USER_DATA_DIR.mkdir(parents=True, exist_ok=True)

from constants import (
    APP_NAME,
    APP_VERSION,
    APP_TITLE,
    CPU_NAME,
    CPU_MANUFACTURER,
    CPU_DESCRIPTION,
    QEMU_BIN,
    COLOR_BG_DARK,
    COLOR_BG_MEDIUM,
    COLOR_BG_LIGHT,
    COLOR_TEXT,
    COLOR_TEXT_DIM,
    COLOR_BORDER,
    DEFAULT_RAM,
    DEFAULT_CORES,
    DEFAULT_FREQ,
    DEFAULT_STORAGE,
    MIN_RAM,
    MAX_RAM,
    MIN_CORES,
    MAX_CORES,
    MIN_FREQ,
    MAX_FREQ,
    MIN_STORAGE,
    MAX_STORAGE,
    get_base_path,
    get_iso_path,
    get_logo_path,
    FONT_TITLE,
    FONT_PRIMARY,
    FONT_HEADER,
    FONT_SECONDARY,
    FONT_MONO,
)

from schematic import CPUSchematic


class BrosLauncherWindow:
    def __init__(self, root):
        self.root = root
        self.root.title(APP_TITLE)
        self.root.geometry("1100x700")
        self.root.minsize(1000, 650)
        self.root.configure(bg=COLOR_BG_DARK)

        self.running = False
        self.vm_process = None
        self.log_queue = queue.Queue()
        self.qemu_available = self.check_qemu()

        self.scale_cores = None
        self.scale_freq = None
        self.scale_ram = None
        self.scale_storage = None

        self.cpu_cores = tk.IntVar(value=DEFAULT_CORES)
        self.cpu_freq = tk.IntVar(value=DEFAULT_FREQ)
        self.ram_size = tk.IntVar(value=DEFAULT_RAM)
        self.storage_size = tk.IntVar(value=DEFAULT_STORAGE)

        self.iso_path = get_iso_path()

        self.load_logo()
        self.create_ui()
        self.log_init()

    def check_qemu(self):
        qemu_path = shutil.which("qemu-system-x86_64")
        if qemu_path:
            return True
        return False

    def load_logo(self):
        logo_file = get_logo_path()
        if os.path.exists(logo_file):
            try:
                self.logo = tk.PhotoImage(file=logo_file)
                self.logo = self.logo.subsample(2, 2)
            except:
                self.logo = None
        else:
            self.logo = None

    def create_ui(self):
        self.root.configure(bg=COLOR_BG_DARK)

        self.create_header()

        main_frame = tk.Frame(self.root, bg=COLOR_BG_DARK)
        main_frame.pack(fill=tk.BOTH, expand=True)

        left = tk.Frame(main_frame, bg=COLOR_BG_MEDIUM, width=250)
        left.pack(side=tk.LEFT, fill=tk.Y)
        left.pack_propagate(False)
        self.create_settings_panel(left)

        right = tk.Frame(main_frame, bg=COLOR_BG_DARK)
        right.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
        self.create_content_panel(right)

        self.create_status_bar()

    def create_header(self):
        header = tk.Frame(self.root, bg="#0a0a0a", height=50)
        header.pack(side=tk.TOP, fill=tk.X)
        header.pack_propagate(False)

        tk.Label(
            header,
            text=APP_NAME,
            font=("Segoe UI", 14, "bold"),
            bg="#0a0a0a",
            fg=COLOR_TEXT,
        ).pack(side=tk.LEFT, padx=15)

        tk.Label(
            header,
            text=f"{CPU_NAME} Virtual Test Environment",
            font=FONT_SECONDARY,
            bg="#0a0a0a",
            fg=COLOR_TEXT_DIM,
        ).pack(side=tk.LEFT, pady=10)

        btn_frame = tk.Frame(header, bg="#0a0a0a")
        btn_frame.pack(side=tk.RIGHT, padx=10, pady=8)

        btn_row = tk.Frame(btn_frame, bg="#0a0a0a")
        btn_row.pack(side=tk.TOP)

        self.btn_about = tk.Button(
            btn_row,
            text="?",
            command=self.show_about,
            bg=COLOR_BG_LIGHT,
            fg=COLOR_TEXT,
            font=("Segoe UI", 10, "bold"),
            width=3,
            relief=tk.FLAT,
            bd=0,
            padx=8,
            pady=3,
        )
        self.btn_about.pack(side=tk.LEFT, padx=2)

        self.btn_start = tk.Button(
            btn_row,
            text="LAUNCH",
            command=self.start_vm,
            bg="#00aa00",
            fg="#ffffff",
            font=("Segoe UI", 10, "bold"),
            width=10,
            relief=tk.FLAT,
            bd=0,
            padx=15,
            pady=3,
        )
        self.btn_start.pack(side=tk.LEFT, padx=2)

        self.btn_stop = tk.Button(
            btn_row,
            text="STOP",
            command=self.stop_vm,
            bg="#cc0000",
            fg="#ffffff",
            font=("Segoe UI", 10, "bold"),
            width=10,
            relief=tk.FLAT,
            bd=0,
            padx=15,
            pady=3,
            state=tk.DISABLED,
        )
        self.btn_stop.pack(side=tk.LEFT, padx=2)

    def create_settings_panel(self, parent):
        tk.Label(
            parent,
            text="CONFIGURATION",
            bg=COLOR_BG_MEDIUM,
            fg=COLOR_TEXT_DIM,
            font=FONT_HEADER,
            pady=8,
        ).pack()

        self.create_section(
            parent,
            "CPU",
            [
                ("Core(s)", self.cpu_cores, MIN_CORES, MAX_CORES),
                ("Frequency (MHz)", self.cpu_freq, MIN_FREQ, MAX_FREQ),
            ],
        )

        self.create_section(
            parent,
            "Memory",
            [("RAM (MB)", self.ram_size, MIN_RAM, MAX_RAM)],
        )

        self.create_section(
            parent,
            "Storage",
            [("Disk (MB)", self.storage_size, MIN_STORAGE, MAX_STORAGE)],
        )

        self.create_system_info(parent)
        self.create_boot_info(parent)

    def create_section(self, parent, title, items):
        frame = tk.LabelFrame(
            parent,
            text=f" {title} ",
            bg=COLOR_BG_MEDIUM,
            fg=COLOR_TEXT_DIM,
            font=FONT_HEADER,
            padx=10,
            pady=6,
        )
        frame.pack(fill=tk.X, padx=8, pady=4)

        for label, var, min_val, max_val in items:
            tk.Label(
                frame,
                text=label,
                bg=COLOR_BG_MEDIUM,
                fg=COLOR_TEXT_DIM,
                font=FONT_SECONDARY,
            ).pack(anchor=tk.W, pady=(4, 0))

            row = tk.Frame(frame, bg=COLOR_BG_MEDIUM)
            row.pack(fill=tk.X)

            scale = tk.Scale(
                row,
                from_=min_val,
                to=max_val,
                variable=var,
                orient=tk.HORIZONTAL,
                bg=COLOR_BG_MEDIUM,
                fg=COLOR_TEXT,
                highlightthickness=0,
                troughcolor=COLOR_BG_LIGHT,
                length=180,
                resolution=1,
            )
            scale.pack(side=tk.LEFT, fill=tk.X, expand=True)

            if label == "Core(s)":
                self.scale_cores = scale
            elif label == "Frequency (MHz)":
                self.scale_freq = scale
            elif label == "RAM (MB)":
                self.scale_ram = scale
            elif label == "Disk (MB)":
                self.scale_storage = scale

            tk.Label(
                row,
                text=str(var.get()),
                bg=COLOR_BG_MEDIUM,
                fg=COLOR_TEXT,
                font=("Consolas", 10, "bold"),
                width=6,
            ).pack(side=tk.RIGHT, padx=5)

            var.trace("w", lambda *a, v=var, l=label: self.on_setting_change(v, l))

    def on_setting_change(self, var, label):
        self.schematic.update_config(
            cores=self.cpu_cores.get(),
            freq=self.cpu_freq.get(),
            ram=self.ram_size.get(),
        )

    def create_system_info(self, parent):
        info_frame = tk.LabelFrame(
            parent,
            text=" System ",
            bg=COLOR_BG_MEDIUM,
            fg=COLOR_TEXT_DIM,
            font=FONT_HEADER,
            padx=10,
            pady=6,
        )
        info_frame.pack(fill=tk.X, padx=8, pady=8)

        qemu_status = "OK" if self.qemu_available else "MISSING"

        for label, value in [
            ("Platform", platform.system()),
            ("Architecture", "x86_64"),
            ("QEMU", qemu_status),
        ]:
            row = tk.Frame(info_frame, bg=COLOR_BG_MEDIUM)
            row.pack(fill=tk.X)

            tk.Label(
                row,
                text=f"{label}:",
                bg=COLOR_BG_MEDIUM,
                fg=COLOR_TEXT_DIM,
                font=FONT_SECONDARY,
                width=12,
                anchor=tk.W,
            ).pack(side=tk.LEFT)
            value_color = (
                COLOR_TEXT if (label != "QEMU" or self.qemu_available) else "#ff4444"
            )
            tk.Label(
                row,
                text=value,
                bg=COLOR_BG_MEDIUM,
                fg=COLOR_TEXT,
                font=FONT_SECONDARY,
            ).pack(side=tk.RIGHT)

    def create_boot_info(self, parent):
        boot_frame = tk.LabelFrame(
            parent,
            text=" Boot Media ",
            bg=COLOR_BG_MEDIUM,
            fg=COLOR_TEXT_DIM,
            font=FONT_HEADER,
            padx=10,
            pady=6,
        )
        boot_frame.pack(fill=tk.X, padx=8, pady=8)

        iso_name = os.path.basename(self.iso_path) if self.iso_path else "Not Found"
        iso_status = "OK" if os.path.exists(self.iso_path) else "MISSING"

        tk.Label(
            boot_frame,
            text=iso_name,
            bg=COLOR_BG_MEDIUM,
            fg=COLOR_TEXT,
            font=FONT_SECONDARY,
        ).pack(anchor=tk.W, pady=(0, 3))

        status_color = COLOR_TEXT if os.path.exists(self.iso_path) else "#ff4444"
        tk.Label(
            boot_frame,
            text=f"Status: {iso_status}",
            bg=COLOR_BG_MEDIUM,
            fg=status_color,
            font=FONT_SECONDARY,
        ).pack(anchor=tk.W)

    def create_content_panel(self, parent):
        content = tk.Frame(parent, bg=COLOR_BG_DARK)
        content.pack(fill=tk.BOTH, expand=True, padx=8, pady=8)

        cpu_frame = tk.Frame(content, bg=COLOR_BG_DARK)
        cpu_frame.pack(fill=tk.BOTH, expand=True)
        self.schematic = CPUSchematic(cpu_frame)
        self.schematic.pack(fill=tk.BOTH, expand=True)

        console_frame = tk.Frame(content, bg=COLOR_BG_DARK)
        console_frame.pack(fill=tk.X, pady=5)
        self.create_console(console_frame)

    def create_console(self, parent):
        header = tk.Frame(parent, bg=COLOR_BG_MEDIUM)
        header.pack(fill=tk.X)

        tk.Label(
            header,
            text="CONSOLE OUTPUT",
            bg=COLOR_BG_MEDIUM,
            fg=COLOR_TEXT_DIM,
            font=FONT_HEADER,
            padx=10,
        ).pack(side=tk.LEFT)

        self.btn_clear = tk.Button(
            header,
            text="Clear",
            command=self.clear_console,
            bg=COLOR_BG_LIGHT,
            fg=COLOR_TEXT,
            font=("Segoe UI", 7),
            relief=tk.FLAT,
            bd=0,
            padx=8,
        )
        self.btn_clear.pack(side=tk.RIGHT, padx=5, pady=2)

        self.console = scrolledtext.ScrolledText(
            parent,
            bg="#0a0a0a",
            fg=COLOR_TEXT,
            font=FONT_MONO,
            wrap=tk.WORD,
            state=tk.DISABLED,
            height=8,
        )
        self.console.pack(fill=tk.BOTH, expand=True, padx=8, pady=(0, 8))

        self.console.tag_config("info", foreground="#00ff00")
        self.console.tag_config("warn", foreground="#ffff00")
        self.console.tag_config("error", foreground="#ff4444")
        self.console.tag_config("system", foreground="#00ffff")

    def clear_console(self):
        self.console.configure(state=tk.NORMAL)
        self.console.delete(1.0, tk.END)
        self.console.configure(state=tk.DISABLED)

    def log_to_console(self, message, tag="info"):
        self.console.configure(state=tk.NORMAL)
        self.console.insert(tk.END, message + "\n", tag)
        self.console.see(tk.END)
        self.console.configure(state=tk.DISABLED)

    def create_status_bar(self):
        status = tk.Frame(self.root, bg="#050505", height=24)
        status.pack(side=tk.BOTTOM, fill=tk.X)

        self.status_indicator = tk.Canvas(
            status, width=10, height=10, bg="#050505", highlightthickness=0
        )
        self.status_indicator.pack(side=tk.LEFT, padx=10)
        self.status_indicator.create_oval(0, 0, 10, 10, fill=COLOR_TEXT_DIM)

        self.status_label = tk.Label(
            status, text="Ready", bg="#050505", fg=COLOR_TEXT_DIM, font=FONT_SECONDARY
        )
        self.status_label.pack(side=tk.LEFT)

        self.config_label = tk.Label(
            status,
            text=f"{DEFAULT_CORES} core | {DEFAULT_FREQ} MHz | {DEFAULT_RAM} MB | {DEFAULT_STORAGE} MB",
            bg="#050505",
            fg=COLOR_TEXT_DIM,
            font=FONT_SECONDARY,
        )
        self.config_label.pack(side=tk.RIGHT, padx=12)

    def log_init(self):
        iso_status = "OK" if os.path.exists(self.iso_path) else "MISSING"
        self.log_to_console(f"[INIT] {APP_NAME} v{APP_VERSION}", "system")
        self.log_to_console(f"[INIT] CPU: {CPU_NAME}", "system")
        self.log_to_console(
            f"[INIT] QEMU: {'Available' if self.qemu_available else 'Not Found'}",
            "system",
        )
        self.log_to_console(f"[INIT] ISO: {iso_status}", "info")
        self.log_to_console(f"[INIT] Configuration loaded", "info")

        if not self.qemu_available:
            self.log_to_console(
                "[WARN] QEMU not found - install qemu-system-x86", "warn"
            )

    def show_about(self):
        about_win = tk.Toplevel(self.root)
        about_win.title(f"About {APP_NAME}")
        about_win.geometry("420x400")
        about_win.configure(bg=COLOR_BG_DARK)
        about_win.resizable(False, False)

        content = tk.Frame(about_win, bg=COLOR_BG_DARK)
        content.pack(fill=tk.BOTH, expand=True, padx=20, pady=15)

        tk.Label(
            content,
            text=APP_NAME,
            bg=COLOR_BG_DARK,
            fg=COLOR_TEXT,
            font=("Segoe UI", 16, "bold"),
        ).pack(pady=(0, 5))

        if self.logo:
            lbl = tk.Label(content, image=self.logo, bg=COLOR_BG_DARK)
            lbl.pack(pady=8)

        tk.Label(
            content,
            text=f"Version {APP_VERSION}",
            bg=COLOR_BG_DARK,
            fg=COLOR_TEXT_DIM,
            font=FONT_SECONDARY,
        ).pack()

        sep = tk.Frame(content, bg=COLOR_BORDER, height=1)
        sep.pack(fill=tk.X, pady=10)

        info_data = [
            ("CPU", CPU_NAME),
            ("Manufacturer", CPU_MANUFACTURER),
            ("Architecture", "x86_64"),
            ("Max Cores", "3"),
            ("Default RAM", "2048 MB"),
            ("Boot", "BAHAR Multiboot2"),
            ("File System", "DefneFS v3.2.3"),
            ("Shell", "Brosh v1.1.9"),
        ]

        for label, value in info_data:
            row = tk.Frame(content, bg=COLOR_BG_DARK)
            row.pack(fill=tk.X, pady=2)

            tk.Label(
                row,
                text=f"{label}:",
                bg=COLOR_BG_DARK,
                fg=COLOR_TEXT_DIM,
                width=14,
                anchor=tk.W,
                font=FONT_SECONDARY,
            ).pack(side=tk.LEFT)
            tk.Label(
                row,
                text=value,
                bg=COLOR_BG_DARK,
                fg=COLOR_TEXT,
                font=FONT_SECONDARY,
            ).pack(side=tk.RIGHT)

        sep2 = tk.Frame(content, bg=COLOR_BORDER, height=1)
        sep2.pack(fill=tk.X, pady=10)

        desc = (
            "Virtual machine application for testing\n"
            "the Bros operating system in a\n"
            "graphical environment."
        )

        tk.Label(
            content,
            text=desc,
            bg=COLOR_BG_DARK,
            fg=COLOR_TEXT_DIM,
            font=FONT_SECONDARY,
            justify=tk.CENTER,
        ).pack(pady=5)

        tk.Label(
            content,
            text="2024-2026 Berke Oruc",
            bg=COLOR_BG_DARK,
            fg=COLOR_TEXT_DIM,
            font=("Segoe UI", 7),
        ).pack(pady=(10, 0))

    def start_vm(self):
        if self.running:
            return

        if not self.qemu_available:
            messagebox.showerror(
                "QEMU Not Found",
                "qemu-system-x86_64 is not installed or not in PATH.\n\n"
                "Install it with: pacman -S qemu-system-x86",
            )
            return

        if not os.path.exists(self.iso_path):
            messagebox.showerror(
                "ISO Not Found",
                f"Bros ISO not found at:\n{self.iso_path}\n\n"
                "Please place bros.iso in the application directory.",
            )
            return

        self.running = True
        self.update_ui(True)

        self.schematic.set_running(True)
        self.log_to_console(
            f"[VM] Starting with {self.cpu_cores.get()} cores, {self.ram_size.get()} MB RAM",
            "info",
        )
        self.open_qemu_window()

    def open_qemu_window(self):
        iso = self.iso_path
        cores = self.cpu_cores.get()
        freq = self.cpu_freq.get()
        ram = self.ram_size.get()
        storage = self.storage_size.get()

        disk = f"bros_{storage}mb.img"
        disk_path = str(USER_DATA_DIR / disk)

        if not os.path.exists(disk_path):
            self.log_to_console(f"[VM] Creating disk image: {disk}", "info")
            cmd = [
                "dd",
                f"if=/dev/zero",
                f"of={disk_path}",
                "bs=1M",
                f"count={storage}",
            ]
            subprocess.run(cmd, capture_output=True)

        cmd = [
            QEMU_BIN,
            "-cdrom",
            iso,
            "-drive",
            f"file={disk_path},format=raw,if=ide,index=0,media=disk",
            "-m",
            str(ram),
            "-smp",
            str(cores),
            "-cpu",
            "max",
            "-display",
            "gtk",
            "-vga",
            "std",
            "-net",
            "nic",
            "-net",
            "user",
        ]

        self.log_to_console(f"[VM] Command: {' '.join(cmd[:6])} ...", "system")

        try:
            self.vm_process = subprocess.Popen(
                cmd,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                start_new_session=True,
                text=True,
                bufsize=1,
            )
            self.log_to_console(
                f"[VM] QEMU started (PID: {self.vm_process.pid})", "info"
            )

            self.reader_thread = threading.Thread(target=self.read_output, daemon=True)
            self.reader_thread.start()

            self.monitor_thread = threading.Thread(
                target=self.monitor_process, daemon=True
            )
            self.monitor_thread.start()

        except Exception as e:
            self.log_to_console(f"[VM] Error: {e}", "error")
            self.stop_vm()

    def read_output(self):
        if self.vm_process and self.vm_process.stdout:
            try:
                for line in iter(self.vm_process.stdout.readline, ""):
                    if line:
                        self.log_to_console(line.rstrip(), "info")
            except:
                pass

    def monitor_process(self):
        while self.running and self.vm_process:
            try:
                ret = self.vm_process.poll()
                if ret is not None:
                    self.log_to_console(f"[VM] QEMU exited with code: {ret}", "warn")
                    self.root.after(0, self.stop_vm)
                    break
            except:
                break
            time.sleep(1)

    def stop_vm(self):
        if not self.running:
            return

        self.running = False

        if self.vm_process:
            try:
                self.vm_process.terminate()
                self.vm_process.wait(timeout=5)
            except:
                self.vm_process.kill()
            self.vm_process = None

        self.log_to_console("[VM] Stopped", "warn")

        self.update_ui(False)
        self.schematic.set_running(False)

    def update_ui(self, running):
        if running:
            self.btn_start.config(state=tk.DISABLED)
            self.btn_stop.config(state=tk.NORMAL)
            self.status_indicator.delete("all")
            self.status_indicator.create_oval(0, 0, 10, 10, fill=COLOR_TEXT)
            self.status_label.config(text="Running")
            self.config_label.config(
                text=f"{self.cpu_cores.get()} cores | {self.cpu_freq.get()} MHz | {self.ram_size.get()} MB"
            )
            if self.scale_cores:
                self.scale_cores.config(state=tk.DISABLED)
            if self.scale_freq:
                self.scale_freq.config(state=tk.DISABLED)
            if self.scale_ram:
                self.scale_ram.config(state=tk.DISABLED)
            if self.scale_storage:
                self.scale_storage.config(state=tk.DISABLED)
        else:
            self.btn_start.config(state=tk.NORMAL)
            self.btn_stop.config(state=tk.DISABLED)
            self.status_indicator.delete("all")
            self.status_indicator.create_oval(0, 0, 10, 10, fill=COLOR_TEXT_DIM)
            self.status_label.config(text="Ready")
            self.config_label.config(
                text=f"{DEFAULT_CORES} core | {DEFAULT_FREQ} MHz | {DEFAULT_RAM} MB"
            )
            if self.scale_cores:
                self.scale_cores.config(state=tk.NORMAL)
            if self.scale_freq:
                self.scale_freq.config(state=tk.NORMAL)
            if self.scale_ram:
                self.scale_ram.config(state=tk.NORMAL)
            if self.scale_storage:
                self.scale_storage.config(state=tk.NORMAL)

    def on_closing(self):
        if self.running:
            self.stop_vm()
        self.root.destroy()


def main():
    root = tk.Tk()
    app = BrosLauncherWindow(root)
    root.protocol("WM_DELETE_WINDOW", app.on_closing)
    root.mainloop()


if __name__ == "__main__":
    main()
