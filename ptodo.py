#!/usr/bin/env python

import inspect
import json
import os
import pickle
import time

from rich.align import Align
from rich.console import Console
from rich.panel import Panel
from rich.prompt import Prompt
from rich.table import Table

FILENAME = "TODOLIST.json"
PICKLE_FILE = "my_data.pkl"
console = Console()


def load_todos():
    if os.path.exists(FILENAME):
        with open(FILENAME, "r") as f:
            data = json.load(f)
            if data and isinstance(data[0], str):
                return [{"task": t, "done": False} for t in data]
            return data
    return []


def save_todos(todos):
    with open(FILENAME, "w") as f:
        json.dump(todos, f, indent=4)


def get_task_table(todos):
    table = Table(show_header=True, header_style="bold magenta", expand=True)
    table.add_column("#", style="dim", width=4, justify="center")
    table.add_column("Task", style="cyan")
    table.add_column("Status", justify="right")

    if not todos:
        return Panel("No tasks found! Get to work!", style="red")

    for idx, item in enumerate(todos, 1):
        # Check if done to change display
        task_text = item["task"]
        if item["done"]:
            status = "[bold green]✔ Done[/bold green]"
            display_task = f"[strike dim]{task_text}[/strike dim]"
        else:
            status = "[yellow]Pending[/yellow]"
            display_task = task_text

        table.add_row(str(idx), display_task, status)

    return table


logo = r"""
[bold #cba6f7]___________________  ________    ________  .____    .___  ____________________[/bold #cba6f7]
[bold #cba6f7]\__    ___/\_____  \ \______ \   \_____  \ |    |   |   |/      _____/\__    ___/[/bold #cba6f7]
[bold #89b4fa]  |    |    /    |  \ |    |  \   /   |   \|    |   |   |\_____  \      |    |[/bold #89b4fa]
[bold #89b4fa]  |    |   /     |   \|    `   \ /    |    \    |___|   |/        \     |    |[/bold #89b4fa]
[bold #89b4fa]  |____|   \_________/_________/ \_________/________\___/_________/     |____|[/bold #89b4fa]
"""


def colorscemes():
    global logo
    print_header()
    console.print("\n[1] [bold pink]Catppuchin (Mocha)[/bold pink]")
    console.print("[2] [bold orange]Dracula[/bold orange]")
    console.print("[3] [bold red]Gruvbox[/bold red]")
    console.print("[4] [bold blue]Nord[/bold blue]")
    choice = Prompt.ask(
        "\nChoose",
        choices=[
            "1",
            "2",
            "3",
            "4",
        ],
    )
    if choice == "1":
        logo = inspect.cleandoc(r"""
        [bold #cba6f7]___________________  ________    ________  .____    .___  ____________________[/bold #cba6f7]
        [bold #cba6f7]\__    ___/\_____  \ \______ \   \_____  \ |    |   |   |/      _____/\__    ___/[/bold #cba6f7]
        [bold #89b4fa]  |    |    /    |  \ |    |  \   /   |   \|    |   |   |\_____  \      |    |[/bold #89b4fa]
        [bold #89b4fa]  |    |   /     |   \|    `   \ /    |    \    |___|   |/        \     |    |[/bold #89b4fa]
        [bold #89b4fa]  |____|   \_________/_________/ \_________/________\___/_________/     |____|[/bold #89b4fa]
        """)
        print_header()
        time.sleep(1)
    elif choice == "2":
        logo = inspect.cleandoc(r"""
        [bold #ff79c6]___________________  ________    ________  .____    .___  ____________________[/bold #ff79c6]
        [bold #ff79c6]\__    ___/\_____  \ \______ \   \_____  \ |    |   |   |/      _____/\__    ___/[/bold #ff79c6]
        [bold #bd93f9]  |    |    /    |  \ |    |  \   /   |   \|    |   |   |\_____  \      |    |[/bold #bd93f9]
        [bold #bd93f9]  |    |   /     |   \|    `   \ /    |    \    |___|   |/        \     |    |[/bold #bd93f9]
        [bold #bd93f9]  |____|   \_________/_________/ \_________/________\___/_________/     |____|[/bold #bd93f9]
        """)
        print_header()
        time.sleep(1)
    elif choice == "3":
        logo = inspect.cleandoc(r"""
        [bold #fb4934]___________________  ________    ________  .____    .___  ____________________[/bold #fb4934]
        [bold #fb4934]\__    ___/\_____  \ \______ \   \_____  \ |    |   |   |/      _____/\__    ___/[/bold #fb4934]
        [bold #fabd2f]  |    |    /    |  \ |    |  \   /   |   \|    |   |   |\_____  \      |    |[/bold #fabd2f]
        [bold #fabd2f]  |    |   /     |   \|    `   \ /    |    \    |___|   |/        \     |    |[/bold #fabd2f]
        [bold #fabd2f]  |____|   \_________/_________/ \_________/________\___/_________/     |____|[/bold #fabd2f]
        """)
        print_header()
        time.sleep(1)
    elif choice == "4":
        logo = inspect.cleandoc(r"""
            [bold #88C0D0]___________________  ________    ________  .____    .___  ____________________[/bold #88C0D0]
            [bold #88C0D0]\__    ___/\_____  \ \______ \   \_____  \ |    |   |   |/      _____/\__    ___/[/bold #88C0D0]
            [bold #81A1C1]  |    |    /    |  \ |    |  \   /   |   \|    |   |   |\_____  \      |    |[/bold #81A1C1]
            [bold #81A1C1]  |    |   /     |   \|    `   \ /    |    \    |___|   |/        \     |    |[/bold #81A1C1]
            [bold #81A1C1]  |____|   \_________/_________/ \_________/________\___/_________/     |____|[/bold #81A1C1]
            """)


def print_header():
    os.system("cls" if os.name == "nt" else "clear")
    console.print(Align.center(logo))


def add_mode(todos):
    while True:
        print_header()
        console.print(get_task_table(todos))
        task = Prompt.ask("\n[bold green]Add Task[/bold green] (or 'exit')")
        if task.lower() == "exit":
            break
        if task == "":
            console.print("Please enter something")
            time.sleep(1)
        else:
            todos.append({"task": task, "done": False})
            save_todos(todos)
            console.print(f"[green]Added:[/green] {task}")


def complete_mode(todos):
    while True:
        print_header()
        console.print(get_task_table(todos))
        task_num = Prompt.ask("\n[bold green]Complete Number[/bold green] (or 'exit')")
        if task_num.lower() == "exit":
            break
        if task_num.isdigit():
            idx = int(task_num) - 1
            if 0 <= idx < len(todos):
                todos[idx]["done"] = True
                save_todos(todos)
                console.print("[green]Task marked as done![/green]")
            else:
                console.print("[red]Invalid number![/red]")


def remove_mode(todos):
    while True:
        print_header()
        console.print(get_task_table(todos))
        task_num = Prompt.ask("\n[bold red]Delete Number[/bold red] (or 'exit')")
        if task_num.lower() == "exit":
            break
        if task_num.isdigit():
            idx = int(task_num) - 1
            if 0 <= idx < len(todos):
                removed = todos.pop(idx)["task"]
                save_todos(todos)
                console.print(f"[red]Removed:[/red] {removed}")
            else:
                console.print("[red]Invalid number![/red]")


def removeAll_mode(todos):
    while True:
        print_header()
        console.print(get_task_table(todos))
        task_1 = Prompt.ask(
            "\n[bold red]ARE YOU SURE YOU WANT TO REMO0VE ALL TASKS?! Type 'YES' [/bold red] (or 'exit')"
        )
        if task_1.lower() == "exit":
            break
        elif task_1 == "YES":
            os.remove(FILENAME)
            break
        else:
            console.print("[red]Invalid number![/red]")


def app():
    while True:
        todos = load_todos()
        print_header()
        console.print(
            Panel(
                get_task_table(todos), title="Current To-Do List", border_style="blue"
            )
        )

        console.print("\n[1] [bold green]Add Task[/bold green]")
        console.print("[2] [bold blue1]Complete Task[/bold blue1]")
        console.print("[3] [bold orange]Remove Task[/bold orange]")
        console.print("[4] [bold red]Remove all[/bold red]")
        console.print("[5] [bold white]Exit[/bold white]")
        console.print("[6] [bold purple]Settings[/bold purple]")

        choice = Prompt.ask("\nChoose", choices=["1", "2", "3", "4", "5", "exit", "6"])

        if choice == "1":
            add_mode(todos)
        elif choice == "2":
            complete_mode(todos)
        elif choice == "3":
            remove_mode(todos)
        elif choice == "4":
            removeAll_mode(todos)
        elif choice == "5":
            console.print("[bold yellow]Goodbye![/bold yellow]")
            break
        elif choice == "exit":
            console.print("[bold yellow]Goodbye![/bold yellow]")
            break
        elif choice == "6":
            colorscemes()


def load_logo():
    global logo
    if os.path.exists(PICKLE_FILE):
        try:
            with open(PICKLE_FILE, "rb") as f:
                logo = pickle.load(f)
        except Exception:
            pass


def save_logo():
    with open(PICKLE_FILE, "wb") as f:
        pickle.dump(logo, f)


load_logo()
app()
save_logo()
