#!/usr/bin/env python3

import random
import shutil
import time
import sys

# Цвета ANSI
colors = [
    "\033[31m", "\033[32m", "\033[33m",
    "\033[34m", "\033[35m", "\033[36m", "\033[37m"
]
RESET = "\033[0m"

# Скрываем курсор и очищаем экран
print("\033[2J\033[?25l", end="")

def init_streams(columns, rows):
    """Инициализация потоков с плавным хвостом"""
    return [
        {
            "pos": random.uniform(-rows, 0),
            "speed": random.uniform(0.3, 0.6),
            "length": random.randint(3, rows // 2),
            "chars": [" "] * rows,
            "colors": [""] * rows
        } for _ in range(columns)
    ]

# Начальные размеры терминала
size = shutil.get_terminal_size()
columns, rows = size.columns, size.lines
streams = init_streams(columns, rows)

try:
    while True:
        # Обновляем размеры терминала
        size = shutil.get_terminal_size()
        if size.columns != columns or size.lines != rows:
            columns, rows = size.columns, size.lines
            streams = init_streams(columns, rows)
            print("\033[2J", end="")  # очищаем экран

        output = [""] * rows

        for x, stream in enumerate(streams):
            stream["pos"] += stream["speed"]
            head = int(stream["pos"])

            # Генерация нового символа в голове
            if 0 <= head < rows:
                char = random.choice([chr(i) for i in range(33, 127)])
                color = random.choice(colors)
                stream["chars"][head] = char
                stream["colors"][head] = color

            # Постепенное затухание хвоста
            for i in range(rows):
                if 0 <= i < head - stream["length"]:
                    stream["chars"][i] = " "
                    stream["colors"][i] = ""

            # Формируем строку для вывода
            for y in range(rows):
                c = stream["chars"][y]
                col = stream["colors"][y]
                output[y] += f"{col}{c}{RESET if col else ''}"

            # Сброс потока при выходе за нижнюю границу
            if stream["pos"] - stream["length"] > rows:
                stream["pos"] = random.uniform(-rows//2, 0)
                stream["length"] = random.randint(3, rows // 2)
                stream["speed"] = random.uniform(0.3, 0.6)
                stream["chars"] = [" "] * rows
                stream["colors"] = [""] * rows

        # Печать всего экрана за один кадр
        print("\033[H", end="")
        for row in output:
            print(row)

        time.sleep(0.03)  # частота обновления

except KeyboardInterrupt:
    print("\033[?25h")
    sys.exit()
