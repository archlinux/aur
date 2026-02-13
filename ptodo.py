#!/usr/bin/env python

import inspect
import json
import os
import pickle
import time

import questionary
from rich.align import Align
from rich.console import Console
from rich.panel import Panel
from rich.prompt import Prompt
from rich.table import Table

FILENAME = "TODOLIST.json"
PICKLE_FILE = "my_data.pkl"
console = Console()

# Priority Mapping for display and sorting
PRIORITIES = {
    "1": {"label": "[bold red]High[/bold red]", "sort": 1},
    "2": {"label": "[bold yellow]Medium[/bold yellow]", "sort": 2},
    "3": {"label": "[bold blue]Low[/bold blue]", "sort": 3},
    "4": {"label": "[dim]None[/dim]", "sort": 4},
}


def load_todos():
    if os.path.exists(FILENAME):
        with open(FILENAME, "r") as f:
            data = json.load(f)
            for item in data:
                if isinstance(item, dict) and "priority" not in item:
                    item["priority"] = "4"
            if data and isinstance(data[0], str):
                return [{"task": t, "done": False, "priority": "4"} for t in data]
            data.sort(key=lambda x: (x.get("done", False), x.get("priority", "4")))
            return data
    return []


def save_todos(todos):
    with open(FILENAME, "w") as f:
        json.dump(todos, f, indent=4)


def get_task_table(todos):
    table = Table(show_header=True, header_style="bold magenta", expand=True)
    table.add_column("#", style="dim", width=4, justify="center")
    table.add_column("Priority", justify="center", width=12)
    table.add_column("Task", style="cyan")
    table.add_column("Status", justify="right")

    if not todos:
        return Panel("No tasks found! Get to work!", style="red")

    for idx, item in enumerate(todos, 1):
        task_text = item["task"]
        prio_key = item.get("priority", "4")
        prio_display = PRIORITIES.get(prio_key, PRIORITIES["4"])["label"]

        if item["done"]:
            status = "[bold green]✔ Done[/bold green]"
            display_task = f"[strike dim]{task_text}[/strike dim]"
            prio_display = "[dim]-[/dim]"  # Dim priority if done
        else:
            status = "[yellow]Pending[/yellow]"
            display_task = task_text

        table.add_row(str(idx), prio_display, display_task, status)

    return table


logo = r"""
[bold #cba6f7]    ___________________  ________    ________  .____    .___  _______________________[/bold #cba6f7]
[bold #cba6f7]    \__    ___/\_____  \ \______ \   \_____  \ |    |   |   |/      _____/\__    ___/[/bold #cba6f7]
[bold #89b4fa]      |    |    /    |  \ |    |  \   /   |   \|    |   |   |\_____  \      |    |[/bold #89b4fa]
[bold #89b4fa]      |    |   /     |   \|    `   \ /    |    \    |___|   |/        \     |    |[/bold #89b4fa]
[bold #89b4fa]      |____|   \_________/_________/ \_________/________\___/_________/     |____|[/bold #89b4fa]
"""


def colorscemes():
    global logo
    print_header()

    choice = questionary.select(
        "Choose a Color Scheme:",
        choices=[
            questionary.Choice("Catppuchin (Mocha)", value="1"),
            questionary.Choice("Dracula", value="2"),
            questionary.Choice("Gruvbox", value="3"),
            questionary.Choice("Nord", value="4"),
            questionary.Choice("Cancel", value="cancel"),
        ],
    ).ask()

    if choice == "cancel" or choice is None:
        return

    themes = {
        "1": ("[bold #cba6f7]", "[bold #89b4fa]"),
        "2": ("[bold #ff79c6]", "[bold #bd93f9]"),
        "3": ("[bold #fb4934]", "[bold #fabd2f]"),
        "4": ("[bold #88C0D0]", "[bold #81A1C1]"),
    }

    c1, c2 = themes[choice]
    logo = inspect.cleandoc(rf"""
    {c1}    ___________________  ________    ________  .____    .___  _______________________{c1}
    {c1}    \__    ___/\_____  \ \______ \   \_____  \ |    |   |   |/      _____/\__    ___/{c1}
    {c2}      |    |    /    |  \ |    |  \   /   |   \|    |   |   |\_____  \      |    |{c1}
    {c2}      |    |   /     |   \|    `   \ /    |    \    |___|   |/        \     |    |{c1}
    {c2}      |____|   \_________/_________/ \_________/________\___/_________/     |____|{c1}
    """)
    print_header()
    time.sleep(1)


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
        if not task:
            console.print("Please enter something")
            time.sleep(1)
            continue

        console.print("\n[1] High [2] Medium [3] Low [4] None")
        prio = Prompt.ask("Set Priority", choices=["1", "2", "3", "4"], default="4")
        todos.append({"task": task, "done": False, "priority": prio})
        save_todos(todos)
        console.print(f"[green]Added:[/green] {task}")
        time.sleep(1)


def complete_mode(todos):
    while True:
        print_header()
        console.print(get_task_table(todos))

        pending_tasks = [(i, t) for i, t in enumerate(todos) if not t["done"]]
        if not pending_tasks:
            console.print("\n[yellow]No pending tasks to complete![/yellow]")
            time.sleep(1.5)
            break

        choices = [
            questionary.Choice(f"Task {i + 1}: {t['task']}", value=str(i))
            for i, t in pending_tasks
        ]
        choices.append(questionary.Choice("🔙 Back", value="exit"))

        task_num = questionary.select(
            "\nSelect a task to complete:", choices=choices
        ).ask()

        if task_num == "exit" or task_num is None:
            break

        idx = int(task_num)
        todos[idx]["done"] = True
        save_todos(todos)
        console.print("[green]Task marked as done![/green]")
        time.sleep(1)


def edit_mode(todos):
    while True:
        print_header()
        console.print(get_task_table(todos))
        task_num = Prompt.ask("\n[bold yellow]Edit Number[/bold yellow] (or 'exit')")
        if task_num.lower() == "exit":
            break
        if task_num.isdigit():
            idx = int(task_num) - 1
            if 0 <= idx < len(todos):
                new_task = Prompt.ask(
                    "Enter new task name (Leave blank to keep current)",
                    default=todos[idx]["task"],
                )
                console.print("[1] High [2] Medium [3] Low [4] None")
                new_prio = Prompt.ask(
                    "Update Priority",
                    choices=["1", "2", "3", "4"],
                    default=todos[idx]["priority"],
                )

                todos[idx]["task"] = new_task
                todos[idx]["priority"] = new_prio
                save_todos(todos)
                console.print("[yellow]Task updated![/yellow]")
            else:
                console.print("[red]Invalid number![/red]")


def remove_mode(todos):
    while True:
        print_header()
        console.print(get_task_table(todos))

        if not todos:
            console.print("\n[yellow]No tasks to remove![/yellow]")
            time.sleep(1.5)
            break

        choices = [
            questionary.Choice(f"Task {i + 1}: {t['task']}", value=str(i))
            for i, t in enumerate(todos)
        ]
        choices.append(questionary.Choice("🔙 Back", value="exit"))

        task_num = questionary.select(
            "\nSelect a task to delete:", choices=choices
        ).ask()

        if task_num == "exit" or task_num is None:
            break

        idx = int(task_num)
        removed = todos.pop(idx)["task"]
        save_todos(todos)
        console.print(f"[red]Removed:[/red] {removed}")
        time.sleep(1)


def removeAll_mode(todos):
    print_header()
    console.print(get_task_table(todos))
    confirm = Prompt.ask(
        "\n[bold red]ARE YOU SURE? Type 'YES' to delete everything[/bold red]",
        default="no",
    )
    if confirm == "YES":
        if os.path.exists(FILENAME):
            os.remove(FILENAME)
        todos.clear()
        console.print("[red]All tasks deleted.[/red]")
        time.sleep(1)


def app():
    while True:
        todos = load_todos()
        print_header()
        console.print("\n")
        console.print(
            Panel(
                get_task_table(todos), title="Current To-Do List", border_style="blue"
            )
        )

        console.print(
            Align.center(
                "\n     [1] [bold green]Add Task[/bold green]     [2] [bold blue]Complete Task[/bold blue]"
            )
        )
        console.print(
            Align.center(
                " [3] [bold red]Remove Task[/bold red]  [4] [bold yellow]Edit Task[/bold yellow]"
            )
        )
        console.print(
            Align.center(
                "[5] [bold white]Remove All[/bold white]   [6] [bold magenta]Settings[/bold magenta]"
            )
        )
        console.print(Align.center(" [7] [bold dim]Exit[/bold dim]"))

        choice = Prompt.ask(
            "\nChoose", choices=["1", "2", "3", "4", "5", "6", "7", "exit"]
        )

        if choice == "1":
            add_mode(todos)
        elif choice == "2":
            complete_mode(todos)
        elif choice == "3":
            remove_mode(todos)
        elif choice == "4":
            edit_mode(todos)
        elif choice == "5":
            removeAll_mode(todos)
        elif choice == "6":
            colorscemes()
        elif choice in ["7", "exit"]:
            console.print("[bold yellow]Goodbye![/bold yellow]")
            break


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
