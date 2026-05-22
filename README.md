# FastFlowLM-gtk

A clean, native GTK4 chat client for [FastFlowLM](https://github.com/FastFlowLM/FastFlowLM).

I built this because I wanted something that actually felt like it belonged on the desktop — no web UI, no Electron, just a proper native app that works well with tiling window managers and GNOME.


## Why I Made This

Most local LLM interfaces feel like they were designed for browsers. I wanted something lightweight, fast, and native. Something where I could just open it, pick a model, and start chatting without dealing with Docker, ports, or heavy web interfaces.


## What It Does

- One-click model management — Download, load, and switch models directly from the app
- Proper syntax highlighting — Uses GtkSourceView 5 (supports Python, C++, Bash, JS, etc.)
- Vision support — Works with VLMs and handles images properly
- Keyboard-first design — Full hotkey support (Ctrl+N, F9, Shift+Enter, etc.)
- Smart session handling — Auto-saves everything, fast search, and doesn't lose your chats
- RAM safety — Warns you before loading a model that might freeze your system

It’s built with GTK 4 + Libadwaita, so it looks and feels like a real Linux app.


## Keyboard Shortcuts

|-----------------------------------------------|
| Shortcut            | Action                  |
|---------------------|-------------------------|
| Ctrl + N            | New chat                |
| Ctrl + F            | Search chats            |
| F9                  | Toggle sidebar          |
| Ctrl + Shift + C    | Copy last response      |
| Ctrl + ? / Ctrl + / | Show shortcuts          |
| Enter               | Send message            |
| Shift + Enter       | New line                |
|-----------------------------------------------|

## Installation (Arch Linux)

```
sudo pacman -S gtk4 libadwaita gtksourceview5 libsoup3 python-gobject python-psutil fastflowlm
```

### yay (Recommended)

```bash
yay -S fastflowlm-gtk
```

### Manual Build

``` 
git clone https://github.com/marleylinux/FastFlowLM-gtk
cd FastFlowLM-gtk
sudo ./install.sh
```
### Run directly

```
python app.py
```
