#!/usr/bin/env python3
import sys
import os
import json

CONFIG_FILE = os.path.expanduser("~/.config/prism/config.json")

THEME_REGISTRY = {
    "cyberpunk": {
        "user_prompt_symbol": "☣",
        "assistant_name": "CHROME_PRISM",
        "banner_style": "custom",
        "custom_colors": ["#00FFFF", "#FF0055", "#FFFF00"],
        "theme_accent_phase": 3.14
    },
    "synthwave": {
        "user_prompt_symbol": "▲",
        "assistant_name": "NEON_PRISM",
        "banner_style": "custom",
        "custom_colors": ["#FE019A", "#00F0FF", "#390099"],
        "theme_accent_phase": 1.0
    }
}

def show_help():
    print("\n\033[1;36m--- Available PRISM Themes ---\033[0m")
    for name in THEME_REGISTRY.keys():
        print(f"  • {name}")
    print("\nRun: \033[33mprism-theme <name>\033[0m to apply a style layer.\n")

def apply_theme(name):
    if name not in THEME_REGISTRY:
        print(f"\033[31m[-] Style layer '{name}' not found in registry.\033[0m")
        show_help()
        return

    if not os.path.exists(CONFIG_FILE):
        print("\033[33m[!] Active PRISM configuration file not found.\033[0m")
        print("\033[90mRun 'prismcli' once to let it generate the base environment configuration.\033[0m")
        return

    try:
        with open(CONFIG_FILE, "r") as f:
            user_config = json.load(f)
            
        selected_theme = THEME_REGISTRY[name]
        for key, val in selected_theme.items():
            user_config[key] = val

        with open(CONFIG_FILE, "w") as f:
            json.dump(user_config, f, indent=4)

        print(f"\033[1;32m✔ Success! Applied the '{name}' theme variables to your PRISM configuration.\033[0m")
    except Exception as e:
        print(f"\033[31m[-] Configuration injection failed: {e}\033[0m")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        show_help()
    else:
        apply_theme(sys.argv[1].strip().lower())
