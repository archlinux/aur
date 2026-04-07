#!/usr/bin/env python

import curses
import json
import os
import pickle
import shutil

"""IMPORTANT"""
"""I replaced cat (the shortform for category) to kitty, dont ask why :)"""

# Define data directory and ensure it exists
DATA_DIR = os.path.expanduser("~/ptodo")
os.makedirs(DATA_DIR, exist_ok=True)

# File paths, now in ~/ptodo/
FILENAME = os.path.join(DATA_DIR, "TODOLIST.json")
PICKLE_FILE = os.path.join(DATA_DIR, "theme_data_curses.pkl")
GROCERY_DICT_FILE = os.path.join(DATA_DIR, "GROCERY_DICT.json")
GROCERY_LIST_FILE = os.path.join(DATA_DIR, "GROCERY_LIST.json")

# Old file paths for migration purposes
OLD_FILENAME = os.path.join(os.path.expanduser("~"), "TODOLIST.json")
OLD_PICKLE_FILE = os.path.join(os.path.expanduser("~"), "theme_data_curses.pkl")
OLD_GROCERY_DICT_FILE = os.path.join(os.path.expanduser("~"), "GROCERY_DICT.json")
OLD_GROCERY_LIST_FILE = os.path.join(os.path.expanduser("~"), "GROCERY_LIST.json")


def migrate_files():
    """Migrate files from home directory to ~/ptodo/ if they exist there."""
    migrations = [
        (OLD_FILENAME, FILENAME),
        (OLD_PICKLE_FILE, PICKLE_FILE),
        (OLD_GROCERY_DICT_FILE, GROCERY_DICT_FILE),
        (OLD_GROCERY_LIST_FILE, GROCERY_LIST_FILE),
    ]

    for old_path, new_path in migrations:
        if os.path.exists(old_path) and not os.path.exists(new_path):
            shutil.copy2(old_path, new_path)


LOGO = [
    r"___________________  ________    ________  .____    .___  _______________________",
    r"\__    ___/\_____  \ \______ \   \_____  \ |    |   |   |/      _____/\__    ___/",
    r"  |    |    /   |   \ |    |  \   /   |   \|    |   |   |\_____  \      |    |   ",
    r"  |    |   /    |    \|    `   \ /    |    \    |___|   |/        \     |    |   ",
    r"  |____|   \_________/_________/ \_________/________\___/_________/     |____|   ",
]

DEFAULT_CATEGORIES = {
    "Fruits": [
        "apple",
        "banana",
        "orange",
        "grape",
        "strawberry",
        "blueberry",
        "raspberry",
        "lemon",
        "lime",
        "peach",
        "pear",
        "mango",
        "pineapple",
        "kiwi",
        "melon",
        "cherry",
        "avocado",
        "plum",
        "fig",
        "apricot",
        "cranberry",
        "date",
        "pomegranate",
    ],
    "Vegetables": [
        "carrot",
        "broccoli",
        "spinach",
        "lettuce",
        "tomato",
        "cucumber",
        "onion",
        "garlic",
        "potato",
        "sweet potato",
        "bell pepper",
        "zucchini",
        "eggplant",
        "cabbage",
        "kale",
        "celery",
        "mushroom",
        "corn",
        "peas",
        "green bean",
        "asparagus",
        "brussels sprout",
        "cauliflower",
        "squash",
        "ginger",
        "chili",
        "jalapeno",
        "artichoke",
        "radish",
        "beet",
        "leek",
        "bok choy",
    ],
    "Dairy & Eggs": [
        "milk",
        "cheese",
        "yogurt",
        "butter",
        "egg",
        "cream",
        "sour cream",
        "cottage cheese",
        "cream cheese",
        "ghee",
        "kefir",
        "creamer",
        "margarine",
        "feta",
        "cheddar",
        "mozzarella",
        "quark",
    ],
    "Meat & Seafood": [
        "chicken",
        "beef",
        "sausage",
        "ham",
        "turkey",
        "fish",
        "salmon",
        "tuna",
        "shrimp",
        "crab",
        "scallop",
        "lamb",
        "steak",
        "hot dog",
        "salami",
        "pepperoni",
        "cod",
        "tilapia",
        "oyster",
        "clams",
    ],
    "Pantry Items": [
        "pasta",
        "rice",
        "flour",
        "sugar",
        "salt",
        "pepper",
        "oil",
        "vinegar",
        "canned",
        "soup",
        "sauce",
        "cereal",
        "oats",
        "tortilla",
        "coffee",
        "tea",
        "jam",
        "honey",
        "spices",
        "nuts",
        "beans",
        "lentils",
        "broth",
        "syrup",
        "baking soda",
        "baking powder",
        "ketchup",
        "mustard",
        "mayonnaise",
        "crackers",
        "granola",
        "dried fruit",
        "peanut butter",
        "almond butter",
        "soy sauce",
        "olive oil",
        "vegetable oil",
        "quinoa",
        "couscous",
        "brownie mix",
        "cake mix",
        "chocolate chips",
        "gelatin",
        "cornstarch",
        "yeast",
        "olives",
        "pickles",
        "chips",
        "cookies",
        "salsa",
    ],
    "Frozen Foods": [
        "ice cream",
        "frozen pizza",
        "frozen vegetable",
        "frozen fruit",
        "frozen meal",
        "waffle",
        "fries",
        "tater tot",
        "burrito",
        "nuggets",
        "fish sticks",
        "hash brown",
        "popsicle",
        "sorbet",
        "ice",
        "dough",
        "smoothie mix",
    ],
    "Beverages": [
        "juice",
        "soda",
        "water",
        "cola",
        "sparkling water",
        "tea bag",
        "coffee grounds",
        "energy drink",
        "sports drink",
        "liquer",
        "milk",
    ],
    "Snacks": [
        "chips",
        "cookie",
        "cracker",
        "bar",
        "candy",
        "chocolate",
        "popcorn",
        "pretzels",
        "nuts",
        "granola bar",
        "fruit snack",
        "gummy",
        "trail mix",
        "rice cakes",
    ],
    "Bakery": [
        "bread",
        "bagel",
        "muffin",
        "croissant",
        "donut",
        "pastry",
        "pie",
        "cupcake",
        "sourdough",
        "rolls",
        "buns",
        "tarts",
    ],
    "Household & Personal Care": [
        "soap",
        "shampoo",
        "conditioner",
        "toothpaste",
        "brush",
        "detergent",
        "cleaner",
        "toilet paper",
        "paper towel",
        "sponge",
        "lotion",
        "razor",
        "tissue",
        "trash bag",
        "dish soap",
        "hand soap",
        "deodorant",
        "mouthwash",
        "laundry",
        "fabric softener",
        "bleach",
        "disinfectant",
        "air freshener",
        "light bulb",
        "battery",
        "aluminum foil",
        "plastic wrap",
        "ziploc",
        "band-aid",
        "medicine",
        "vitamins",
        "shaving cream",
    ],
    "Other": [],
}


def load_todos():
    """Loads tasks and ensures backwards compatibility by assigning default priorities."""
    if os.path.exists(FILENAME):
        try:
            with open(FILENAME, "r") as f:
                data = json.load(f)
                for item in data:
                    if isinstance(item, dict) and "priority" not in item:
                        item["priority"] = "4"  # Default priority

                # Handle legacy string-only lists
                if data and isinstance(data[0], str):
                    return [{"task": t, "done": False, "priority": "4"} for t in data]

                # Sort: Pending items first, then by priority
                data.sort(key=lambda x: (x.get("done", False), x.get("priority", "4")))
                return data
        except Exception:
            return []
    return []


def save_todos(todos):
    with open(FILENAME, "w") as f:
        json.dump(todos, f, indent=4)


def load_grocery_dict():
    if os.path.exists(GROCERY_DICT_FILE):
        try:
            with open(GROCERY_DICT_FILE, "r") as f:
                return json.load(f)
        except Exception:
            pass
    return DEFAULT_CATEGORIES.copy()


def save_grocery_dict(d):
    with open(GROCERY_DICT_FILE, "w") as f:
        json.dump(d, f, indent=4)


def load_grocery_list(categories):
    """Loads the active grocery list and synchronizes it with current categories."""
    if os.path.exists(GROCERY_LIST_FILE):
        try:
            with open(GROCERY_LIST_FILE, "r") as f:
                data = json.load(f)
                # Sync missing categories
                for kitty in categories:  # kitty instead of cat :)
                    if kitty not in data:
                        data[kitty] = []
                return data
        except Exception:
            pass
    return {category: [] for category in categories}


def save_grocery_list(l):
    with open(GROCERY_LIST_FILE, "w") as f:
        json.dump(l, f, indent=4)


def draw_logo(stdscr, theme_id):
    """Maps theme_ids to curses color pairs and centers the logo."""
    themes = {"1": (6, 3), "2": (6, 5), "3": (1, 2), "4": (5, 3)}
    c1_idx, c2_idx = themes.get(theme_id, (6, 3))
    h, w = stdscr.getmaxyx()
    for i, line in enumerate(LOGO):
        x = max(0, (w - len(line)) // 2)
        color = curses.color_pair(c1_idx) if i < 2 else curses.color_pair(c2_idx)
        try:
            stdscr.addstr(i + 1, x, line, color | curses.A_BOLD)
        except curses.error:
            pass


def draw_table(stdscr, todos, start_y):
    """Draws the formatted todo table, preventing output beyond terminal height."""
    h, w = stdscr.getmaxyx()
    if not todos:
        msg = "No tasks found! Get to work!"
        try:
            stdscr.addstr(
                start_y,
                max(0, (w - len(msg)) // 2),
                msg,
                curses.color_pair(1) | curses.A_BOLD,
            )
        except curses.error:
            pass
        return start_y + 2

    header = f"{'#':<4} | {'Priority':<10} | {'Task':<30} | {'Status':>15}"
    row_x = max(0, (w - len(header)) // 2)
    try:
        stdscr.addstr(start_y, row_x, header, curses.color_pair(6) | curses.A_BOLD)
        stdscr.addstr(start_y + 1, row_x, "-" * len(header), curses.color_pair(6))
    except curses.error:
        pass

    y = start_y + 2
    for idx, item in enumerate(todos, 1):
        if y >= h - 8:  # Leave space for the bottom menu
            break
        task_text = (
            item["task"][:27] + "..." if len(item["task"]) > 30 else item["task"]
        )
        prio_key = item.get("priority", "4")
        prio_map = {
            "1": ("High", curses.color_pair(1) | curses.A_BOLD),
            "2": ("Medium", curses.color_pair(2) | curses.A_BOLD),
            "3": ("Low", curses.color_pair(3) | curses.A_BOLD),
            "4": ("None", curses.color_pair(7) | curses.A_DIM),
        }
        p_lbl, p_color = prio_map.get(prio_key, prio_map["4"])

        if item.get("done"):
            status_lbl, status_color, task_attr, p_lbl, p_color = (
                "✔ Done",
                curses.color_pair(4) | curses.A_BOLD,
                curses.color_pair(7) | curses.A_DIM,
                "-",
                curses.color_pair(7) | curses.A_DIM,
            )
        else:
            status_lbl, status_color, task_attr = (
                "Pending",
                curses.color_pair(2),
                curses.color_pair(5),
            )

        try:
            stdscr.addstr(y, row_x, f"{idx:<4} | ", curses.color_pair(7))
            stdscr.addstr(y, row_x + 7, f"{p_lbl:<10}", p_color)
            stdscr.addstr(y, row_x + 18, f"| {task_text:<30} | ", task_attr)
            stdscr.addstr(y, row_x + 53, f"{status_lbl:>13}", status_color)
        except curses.error:
            pass
        y += 1
    return y


def draw_grocery_table(stdscr, grocery_list, start_y):
    """Flattens the grocery dictionary into a displayable list, showing only recent items to fit screen."""
    h, w = stdscr.getmaxyx()
    flat_list = []
    for cat, items in grocery_list.items():
        for item in items:
            flat_list.append((cat, item))

    if not flat_list:
        msg = "Your grocery list is empty!"
        try:
            stdscr.addstr(
                start_y,
                max(0, (w - len(msg)) // 2),
                msg,
                curses.color_pair(2) | curses.A_BOLD,
            )
        except curses.error:
            pass
        return start_y + 2

    header = f"{'#':<4} | {'Category':<25} | {'Item':<30}"
    row_x = max(0, (w - len(header)) // 2)
    try:
        stdscr.addstr(start_y, row_x, header, curses.color_pair(5) | curses.A_BOLD)
        stdscr.addstr(start_y + 1, row_x, "-" * len(header), curses.color_pair(5))
    except curses.error:
        pass

    y = start_y + 2
    visible_count = h - start_y - 10
    display_items = (
        flat_list[-visible_count:] if len(flat_list) > visible_count else flat_list
    )

    for idx, (cat, item) in enumerate(display_items, 1):
        try:
            stdscr.addstr(y, row_x, f"{idx:<4} | ", curses.color_pair(7))
            stdscr.addstr(y, row_x + 7, f"{cat:<25}", curses.color_pair(6))
            stdscr.addstr(y, row_x + 33, f"| {item:<30}", curses.color_pair(7))
        except curses.error:
            pass
        y += 1
    return y


def prompt_input(stdscr, prompt_text, y, x):
    """Displays a prompt and captures user string input via curses echo."""
    try:
        stdscr.addstr(y, x, prompt_text, curses.color_pair(4) | curses.A_BOLD)
        curses.curs_set(1)
        curses.echo()
        s = stdscr.getstr(y, x + len(prompt_text)).decode("utf-8")
        curses.noecho()
        curses.curs_set(0)
        return s
    except Exception:
        return ""


def select_list(stdscr, title, items, theme_id):
    """Generic scrolling interactive menu. Returns the value of the selected item."""
    current = 0
    while True:
        stdscr.clear()
        draw_logo(stdscr, theme_id)
        h, w = stdscr.getmaxyx()
        try:
            stdscr.addstr(
                8,
                max(0, (w - len(title)) // 2),
                title,
                curses.color_pair(6) | curses.A_BOLD,
            )
        except curses.error:
            pass

        # Calculate sliding window for scrolling
        max_visible = h - 12
        start_idx = max(0, current - max_visible // 2)
        end_idx = min(len(items), start_idx + max_visible)

        for i in range(start_idx, end_idx):
            lbl, val = items[i]
            y, x = 10 + (i - start_idx), max(0, (w - len(lbl)) // 2 - 2)
            try:
                attr = (
                    curses.color_pair(7) | curses.A_REVERSE
                    if i == current
                    else curses.color_pair(7)
                )
                stdscr.addstr(y, x, f"{'> ' if i == current else '  '}{lbl}", attr)
            except curses.error:
                pass

        stdscr.refresh()
        key = stdscr.getch()
        if key == curses.KEY_UP and current > 0:
            current -= 1
        elif key == curses.KEY_DOWN and current < len(items) - 1:
            current += 1
        elif key in [10, 13]:  # Enter keys
            return items[current][1]
        elif key == 27:  # Escape key
            return None


# --- Action Modes ---
def add_mode(stdscr, todos, theme_id):
    stdscr.clear()
    draw_logo(stdscr, theme_id)
    draw_table(stdscr, todos, 8)
    h, w = stdscr.getmaxyx()
    task = prompt_input(stdscr, "Add Task (or 'exit'): ", h - 4, 2)
    if task and task.lower() != "exit":
        prio = prompt_input(
            stdscr,
            "Priority [1] High [2] Medium [3] Low [4] None (Default 4): ",
            h - 3,
            2,
        )
        todos.append(
            {"task": task, "done": False, "priority": prio if prio in "1234" else "4"}
        )
        save_todos(todos)


def complete_mode(stdscr, todos, theme_id):
    pending = [
        (f"Task {i + 1}: {t['task']}", i) for i, t in enumerate(todos) if not t["done"]
    ]
    if not pending:
        return
    pending.append(("EXIT", None))
    selected = select_list(stdscr, "Select a task to complete:", pending, theme_id)
    if selected is not None:
        todos[selected]["done"] = True
        save_todos(todos)


def edit_mode(stdscr, todos, theme_id):
    stdscr.clear()
    draw_logo(stdscr, theme_id)
    draw_table(stdscr, todos, 8)
    h, w = stdscr.getmaxyx()
    task_num = prompt_input(stdscr, "Edit Number (or 'exit'): ", h - 4, 2)
    if task_num.isdigit():
        idx = int(task_num) - 1
        if 0 <= idx < len(todos):
            new_task = prompt_input(
                stdscr, f"New name (Enter for '{todos[idx]['task']}'): ", h - 3, 2
            )
            new_prio = prompt_input(
                stdscr,
                f"New Priority [1/2/3/4] (Current {todos[idx]['priority']}): ",
                h - 2,
                2,
            )
            if new_task:
                todos[idx]["task"] = new_task
            if new_prio in "1234":
                todos[idx]["priority"] = new_prio
            save_todos(todos)


def remove_mode(stdscr, todos, theme_id):
    if not todos:
        return
    options = [(f"Task {i + 1}: {t['task']}", i) for i, t in enumerate(todos)] + [
        ("EXIT", None)
    ]
    selected = select_list(stdscr, "Select a task to delete:", options, theme_id)
    if selected is not None:
        todos.pop(selected)
        save_todos(todos)


def removeAll_mode(stdscr, todos, theme_id):
    stdscr.clear()
    draw_logo(stdscr, theme_id)
    draw_table(stdscr, todos, 8)
    h, w = stdscr.getmaxyx()
    if (
        prompt_input(stdscr, "ARE YOU SURE? Type 'YES' to delete all: ", h - 3, 2)
        == "YES"
    ):
        if os.path.exists(FILENAME):
            os.remove(FILENAME)
        todos.clear()


def grocery_sorter_mode(stdscr, theme_id):
    """Interactive loop for auto-categorizing inputs based on GROCERY_DICT keywords."""
    category_keywords = load_grocery_dict()
    sorted_groceries = load_grocery_list(category_keywords.keys())
    last_action = ""

    while True:
        stdscr.clear()
        draw_logo(stdscr, theme_id)
        h, w = stdscr.getmaxyx()

        title = "--- SMART GROCERY SORTER ---"
        try:
            stdscr.addstr(
                7,
                max(0, (w - len(title)) // 2),
                title,
                curses.color_pair(6) | curses.A_BOLD,
            )
            if last_action:
                stdscr.addstr(
                    h - 2, 2, f"Last Action: {last_action}", curses.color_pair(2)
                )
        except curses.error:
            pass

        draw_grocery_table(stdscr, sorted_groceries, 9)

        prompt_str = "Item (or 'done', '!addword', '!clear'): "
        item_input = prompt_input(stdscr, prompt_str, h - 4, 2)

        if not item_input:
            continue
        if item_input.lower() == "done":
            break

        # Admin command: Clear list
        if item_input.lower() == "!clear":
            sorted_groceries = {cat: [] for cat in category_keywords}
            save_grocery_list(sorted_groceries)
            last_action = "List cleared."
            continue

        # Admin command: Explicitly teach a new keyword
        if item_input.lower() == "!addword":
            new_word = prompt_input(stdscr, "Keyword to teach: ", h - 3, 2)
            if new_word:
                chosen_kitty = select_list(
                    stdscr,
                    f"Assign '{new_word}' to:",
                    [(c, c) for c in category_keywords.keys()],
                    theme_id,
                )
                if chosen_kitty:
                    if new_word.lower() not in category_keywords[chosen_kitty]:
                        category_keywords[chosen_kitty].append(new_word.lower())
                        save_grocery_dict(category_keywords)
                        last_action = f"Taught '{new_word}' -> {chosen_kitty}."
            continue

        item_normalized = item_input.lower()
        assigned = False

        # Check if the input contains any known category keywords
        for category, keywords in category_keywords.items():
            if any(kw in item_normalized for kw in keywords if kw):
                sorted_groceries[category].append(item_input)
                save_grocery_list(sorted_groceries)
                last_action = f"Auto-added '{item_input}' to {category}."
                assigned = True
                break

        # Fallback if unknown: ask user to categorize
        if not assigned:
            chosen_kitty = select_list(
                stdscr,
                f"Where does '{item_input}' belong?",
                [(c, c) for c in category_keywords.keys()],
                theme_id,
            )
            if chosen_kitty:
                sorted_groceries[chosen_kitty].append(item_input)
                save_grocery_list(sorted_groceries)
                stdscr.clear()
                draw_logo(stdscr, theme_id)

                # Ask if dictionary should be updated for next time
                if (
                    prompt_input(
                        stdscr,
                        f"Remember '{item_normalized}' for {chosen_kitty}? (y/n): ",
                        10,
                        2,
                    ).lower()
                    == "y"
                ):
                    category_keywords[chosen_kitty].append(item_normalized)
                    save_grocery_dict(category_keywords)
                    last_action = f"Added '{item_input}' and updated dictionary."
                else:
                    last_action = f"Added '{item_input}' once."


def draw_main_menu(stdscr):
    h, w = stdscr.getmaxyx()
    menu = [
        " [1] Add Task     [2] Complete Task  ",
        " [3] Remove Task  [4] Edit Task      ",
        " [5] Remove All   [6] Settings       ",
        " [7] Exit         [8] Grocery Sorter ",
    ]
    for i, line in enumerate(menu):
        try:
            stdscr.addstr(
                h - 6 + i,
                max(0, (w - len(line)) // 2),
                line,
                curses.color_pair(7) | curses.A_BOLD,
            )
        except curses.error:
            pass
    msg = "Choose (1-8): "
    try:
        stdscr.addstr(h - 1, max(0, (w - len(msg)) // 2), msg, curses.color_pair(2))
    except curses.error:
        pass


def main(stdscr):
    # Curses color initializations
    curses.start_color()
    try:
        curses.use_default_colors()
        bg = -1
    except:
        bg = curses.COLOR_BLACK
    for i, col in enumerate(
        [
            curses.COLOR_RED,
            curses.COLOR_YELLOW,
            curses.COLOR_BLUE,
            curses.COLOR_GREEN,
            curses.COLOR_CYAN,
            curses.COLOR_MAGENTA,
            curses.COLOR_WHITE,
        ],
        1,
    ):
        curses.init_pair(i, col, bg)

    theme_id = "1"
    if os.path.exists(PICKLE_FILE):
        try:
            with open(PICKLE_FILE, "rb") as f:
                theme_id = pickle.load(f)
        except:
            pass

    # Main Application Loop
    while True:
        todos = load_todos()
        stdscr.clear()
        draw_logo(stdscr, theme_id)
        draw_table(stdscr, todos, 8)
        draw_main_menu(stdscr)
        stdscr.refresh()
        key = stdscr.getch()

        # Route keys to specific modes
        if key == ord("1"):
            add_mode(stdscr, todos, theme_id)
        elif key == ord("2"):
            complete_mode(stdscr, todos, theme_id)
        elif key == ord("3"):
            remove_mode(stdscr, todos, theme_id)
        elif key == ord("4"):
            edit_mode(stdscr, todos, theme_id)
        elif key == ord("5"):
            removeAll_mode(stdscr, todos, theme_id)
        elif key == ord("6"):
            res = select_list(
                stdscr,
                "Theme:",
                [
                    ("Catppuccin", "1"),
                    ("Dracula", "2"),
                    ("Gruvbox", "3"),
                    ("Nord", "4"),
                    ("Cancel", None),
                ],
                theme_id,
            )
            if res:
                theme_id = res
                pickle.dump(theme_id, open(PICKLE_FILE, "wb"))
        elif key == ord("8"):
            grocery_sorter_mode(stdscr, theme_id)
        elif key in [ord("7"), 27]:  # 27 is the Escape key
            break


if __name__ == "__main__":
    migrate_files()
    curses.wrapper(main)
