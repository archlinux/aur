import tkinter as tk
import random
import time
from constants import (
    COLOR_BG_DARK,
    COLOR_TEXT,
    COLOR_BORDER,
    COLOR_BG_MEDIUM,
    COLOR_BG_LIGHT,
    COLOR_TEXT_DIM,
    DEFAULT_CORES,
    DEFAULT_FREQ,
    DEFAULT_RAM,
)


class CPUSchematic(tk.Canvas):
    def __init__(self, parent, **kwargs):
        super().__init__(parent, bg=COLOR_BG_DARK, highlightthickness=0, **kwargs)
        self.running = False
        self.cores = DEFAULT_CORES
        self.freq = DEFAULT_FREQ
        self.ram = DEFAULT_RAM

        self.core_activity = [0] * 4
        self.instruction_count = 0
        self.memory_reads = 0
        self.memory_writes = 0
        self.cache_hits = 0
        self.cache_misses = 0

        self.animation_id = None
        self.last_update = time.time()

    def update_config(self, cores=None, freq=None, ram=None, storage=None):
        if cores is not None:
            self.cores = cores
        if freq is not None:
            self.freq = freq
        if ram is not None:
            self.ram = ram
        self.draw()

    def set_running(self, running):
        self.running = running
        if running:
            self.instruction_count = 0
            self.memory_reads = 0
            self.memory_writes = 0
            self.cache_hits = 0
            self.cache_misses = 0
            self.last_update = time.time()
            self.animate()
        else:
            if self.animation_id:
                self.after_cancel(self.animation_id)
                self.animation_id = None
        self.draw()

    def animate(self):
        if not self.running:
            return

        now = time.time()
        delta = now - self.last_update
        self.last_update = now

        self.instruction_count += int(
            random.randint(50000, 200000) * delta * self.cores
        )
        self.memory_reads += int(random.randint(10000, 50000) * delta * self.cores)
        self.memory_writes += int(random.randint(5000, 25000) * delta * self.cores)

        hit_rate = random.uniform(0.85, 0.98)
        self.cache_hits += int((self.memory_reads + self.memory_writes) * hit_rate)
        self.cache_misses = (self.memory_reads + self.memory_writes) - self.cache_hits

        for i in range(min(self.cores, 4)):
            base = random.randint(20, 60)
            pulse = int(random.randint(-15, 25) * (delta * 10))
            self.core_activity[i] = max(5, min(95, base + pulse))

        self.draw()
        self.animation_id = self.after(50, self.animate)

    def draw(self):
        self.delete("all")
        w = self.winfo_width() or 700
        h = self.winfo_height() or 450

        self.draw_border(w, h)
        self.draw_header(w)
        self.draw_execution_pipeline(w, h)
        self.draw_cores(w, h)
        self.draw_cache(w, h)
        self.draw_memory_controller(w, h)
        self.draw_stats(w, h)

    def draw_border(self, w, h):
        self.create_rectangle(2, 2, w - 2, h - 2, outline=COLOR_BORDER, width=1)
        self.create_rectangle(5, 5, w - 5, h - 5, outline="#1a1a1a", width=1)

    def draw_header(self, w):
        self.create_text(
            w // 2,
            20,
            text="BROS HM-1 CPU",
            fill=COLOR_TEXT,
            font=("Consolas", 12, "bold"),
        )

    def draw_execution_pipeline(self, w, h):
        y = 50
        h_section = 70
        pad = 15

        self.create_rectangle(
            pad, y, w - pad, y + h_section, fill=COLOR_BG_MEDIUM, outline=COLOR_BORDER
        )

        self.create_text(
            w // 2,
            y + 12,
            text="EXECUTION PIPELINE",
            fill=COLOR_TEXT_DIM,
            font=("Consolas", 8, "bold"),
        )

        stages = [
            ("Fetch", "#404040"),
            ("Decode", "#484848"),
            ("Rename", "#505050"),
            ("Dispatch", "#585858"),
            ("Execute", "#606060"),
            ("Retire", "#686868"),
        ]

        stage_w = (w - pad * 2 - 30) // len(stages)

        for i, (stage, color) in enumerate(stages):
            x = pad + 15 + i * stage_w

            if self.running and i == 4:
                glow = int(time.time() * 10) % 2
                fill = COLOR_TEXT if glow else color
            else:
                fill = color

            self.create_rectangle(
                x,
                y + 28,
                x + stage_w - 8,
                y + h_section - 8,
                fill=fill,
                outline=COLOR_BORDER,
            )
            self.create_text(
                x + stage_w // 2 - 4,
                y + h_section // 2 + 3,
                text=stage,
                fill=COLOR_TEXT if self.running and i == 4 else "#888888",
                font=("Consolas", 7),
            )

    def draw_cores(self, w, h):
        y = 130
        h_section = 140
        pad = 15

        self.create_rectangle(
            pad, y, w - pad, y + h_section, fill=COLOR_BG_MEDIUM, outline=COLOR_BORDER
        )
        self.create_text(
            w // 2,
            y + 12,
            text="PROCESSOR CORES",
            fill=COLOR_TEXT_DIM,
            font=("Consolas", 8, "bold"),
        )

        core_w = (w - pad * 2 - 30) // min(self.cores, 3)

        for i in range(min(self.cores, 3)):
            core_x = pad + 15 + i * core_w

            self.create_rectangle(
                core_x,
                y + 28,
                core_x + core_w - 10,
                y + h_section - 10,
                fill="#0d0d0d",
                outline=COLOR_BORDER,
            )

            self.create_text(
                core_x + core_w // 2 - 5,
                y + 35,
                text=f"CORE {i}",
                fill=COLOR_TEXT,
                font=("Consolas", 9, "bold"),
            )

            bar_y = y + 55
            bar_h = 20
            bar_w = core_w - 30

            self.create_rectangle(
                core_x + 10,
                bar_y,
                core_x + 10 + bar_w,
                bar_y + bar_h,
                fill="#1a1a1a",
                outline=COLOR_BORDER,
            )

            if self.running:
                activity = self.core_activity[i]
                fill_w = int(bar_w * activity / 100)

                gradient = ["#303030", "#404040", "#505050", "#606060", "#707070"]
                if fill_w > 0:
                    self.create_rectangle(
                        core_x + 10,
                        bar_y,
                        core_x + 10 + fill_w,
                        bar_y + bar_h,
                        fill=gradient[min(4, activity // 25)],
                        outline="",
                    )

                pct_text = f"{activity}%"
                pct_color = COLOR_TEXT if activity > 50 else COLOR_TEXT_DIM
            else:
                pct_text = "0%"
                pct_color = COLOR_TEXT_DIM

            self.create_text(
                core_x + core_w // 2 - 5,
                bar_y + bar_h // 2,
                text=pct_text,
                fill=pct_color,
                font=("Consolas", 8, "bold"),
            )

            info_y = bar_y + 30
            self.create_text(
                core_x + 15,
                info_y,
                text=f"Freq: {self.freq} MHz",
                fill=COLOR_TEXT_DIM,
                font=("Consolas", 6),
            )
            self.create_text(
                core_x + 15,
                info_y + 12,
                text="L1-I: 32KB",
                fill=COLOR_TEXT_DIM,
                font=("Consolas", 6),
            )
            self.create_text(
                core_x + 15,
                info_y + 24,
                text="L1-D: 32KB",
                fill=COLOR_TEXT_DIM,
                font=("Consolas", 6),
            )
            self.create_text(
                core_x + 15,
                info_y + 36,
                text="L2: 256KB",
                fill=COLOR_TEXT_DIM,
                font=("Consolas", 6),
            )
            self.create_text(
                core_x + 15,
                info_y + 48,
                text="APIC ID: {0}".format(i),
                fill=COLOR_TEXT_DIM,
                font=("Consolas", 6),
            )

    def draw_cache(self, w, h):
        y = 280
        h_section = 80
        pad = 15

        self.create_rectangle(
            pad,
            y,
            w // 2 - 5,
            y + h_section,
            fill=COLOR_BG_MEDIUM,
            outline=COLOR_BORDER,
        )
        self.create_text(
            pad + (w // 2 - pad - 5) // 2,
            y + 12,
            text="L3 CACHE",
            fill=COLOR_TEXT_DIM,
            font=("Consolas", 8, "bold"),
        )

        self.create_text(
            pad + 40,
            y + 30,
            text="2 MB",
            fill=COLOR_TEXT,
            font=("Consolas", 10, "bold"),
        )
        self.create_text(
            pad + 40, y + 45, text="16-way", fill=COLOR_TEXT_DIM, font=("Consolas", 7)
        )
        self.create_text(
            pad + 40,
            y + 58,
            text="Write-back",
            fill=COLOR_TEXT_DIM,
            font=("Consolas", 7),
        )

        if self.running:
            hit_rate = (
                self.cache_hits / max(1, self.cache_hits + self.cache_misses)
            ) * 100
            self.create_text(
                pad + 80,
                y + 30,
                text=f"Hit: {hit_rate:.0f}%",
                fill=COLOR_TEXT,
                font=("Consolas", 8, "bold"),
            )

        cache_x = w // 2 + 5
        self.create_rectangle(
            cache_x,
            y,
            w - pad,
            y + h_section,
            fill=COLOR_BG_MEDIUM,
            outline=COLOR_BORDER,
        )
        self.create_text(
            cache_x + (w - pad - cache_x) // 2,
            y + 12,
            text="LOCAL APIC",
            fill=COLOR_TEXT_DIM,
            font=("Consolas", 8, "bold"),
        )

        self.create_text(
            cache_x + 30,
            y + 30,
            text="Timer",
            fill=COLOR_TEXT_DIM,
            font=("Consolas", 7),
        )
        self.create_text(
            cache_x + 30,
            y + 42,
            text="Interrupt",
            fill=COLOR_TEXT_DIM,
            font=("Consolas", 7),
        )
        self.create_text(
            cache_x + 30,
            y + 54,
            text="Performance",
            fill=COLOR_TEXT_DIM,
            font=("Consolas", 7),
        )
        self.create_text(
            cache_x + 30, y + 66, text="TSC", fill=COLOR_TEXT_DIM, font=("Consolas", 7)
        )

    def draw_memory_controller(self, w, h):
        y = 370
        h_section = 50
        pad = 15

        self.create_rectangle(
            pad, y, w - pad, y + h_section, fill=COLOR_BG_MEDIUM, outline=COLOR_BORDER
        )
        self.create_text(
            w // 2,
            y + 12,
            text="MEMORY CONTROLLER",
            fill=COLOR_TEXT_DIM,
            font=("Consolas", 8, "bold"),
        )

        if self.running:
            unit = "MB/s"
            rd = self.memory_reads * 8 // 1000000
            wr = self.memory_writes * 8 // 1000000
            if rd > 1000:
                rd, unit = rd // 1000, "GB/s"

            self.create_text(
                pad + 50,
                y + 30,
                text=f"Read: {rd} {unit}",
                fill=COLOR_TEXT,
                font=("Consolas", 8),
            )
            self.create_text(
                pad + 150,
                y + 30,
                text=f"Write: {wr} {unit}",
                fill=COLOR_TEXT,
                font=("Consolas", 8),
            )
        else:
            self.create_text(
                pad + 80, y + 30, text="Idle", fill=COLOR_TEXT_DIM, font=("Consolas", 8)
            )

    def draw_stats(self, w, h):
        y = h - 25

        if self.running:
            status = "● RUNNING"
            status_color = COLOR_TEXT

            pulse = int(time.time() * 4) % 2
            if pulse:
                self.create_oval(w - 90, y - 8, w - 70, y + 8, fill=COLOR_TEXT)
        else:
            status = "○ STOPPED"
            status_color = COLOR_TEXT_DIM

        self.create_text(
            w - 55, y, text=status, fill=status_color, font=("Consolas", 10, "bold")
        )

        if self.running:
            instr_k = self.instruction_count // 1000
            self.create_text(
                w // 2,
                y,
                text=f"{instr_k}K instr | {self.cores} cores | {self.freq} MHz | {self.ram} MB",
                fill=COLOR_TEXT_DIM,
                font=("Consolas", 8),
            )
        else:
            self.create_text(
                w // 2,
                y,
                text=f"{self.cores} cores | {self.freq} MHz | {self.ram} MB",
                fill=COLOR_TEXT_DIM,
                font=("Consolas", 8),
            )
