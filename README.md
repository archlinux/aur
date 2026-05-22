# FastFlowLM-gtk

A lightweight, premium, and lightning-fast native Linux chat client for the [FastFlowLM](https://github.com/FastFlowLM/FastFlowLM) local LLM engine. 

Designed for Linux power users, **FastFlowLM-gtk** is built with **GTK 4** and **Libadwaita**. It is styled to look gorgeous, modern, and adaptive on any setup—whether you are running a full Desktop Environment or a keyboard-centric tiling Window Manager.

---

## 💡 The Philosophy: "Download and Chat"

Interacting with local AI shouldn't feel heavy, and it shouldn't require running a massive, resource-hungry web browser interface just to talk to a model running on your own machine. 

This client is designed by a solo developer to remove the friction of complex setups:
1. **Launch:** Open the app instantly.
2. **Select:** Pick a model from the built-in registry.
3. **Download:** One click downloads and prepares the model for you.
4. **Chat:** Start typing instantly.

No complex Docker configurations, no browser overhead—just pure, local AI running natively on your hardware.

---

## 🚀 Key Features

### 💬 Native & Seamless Chat Interface
* **IDE-Grade Syntax Highlighting:** Integrated **GtkSourceView 5** provides real-time, native syntax highlighting for code snippets (supporting Python, C++, Bash, HTML, JavaScript, and more).
* **Automated Code & File Attachments:** Select any source code or text file. The app reads and automatically converts it into a formatted markdown code block with the correct language extension before sending.
* **Vision Model (VLM) Support:** Seamlessly load images when chatting with vision-capable models. Features automatic, standardized JPEG normalization for maximum model compatibility.
* **Context-Aware Safety Locks:** The attachment button adapts to your selected model. Images are enabled for VLMs but safely restricted for text-only models to avoid inference crashes.

### ⌨️ Keyboard-Driven Design (Window Manager Friendly)
* **Comprehensive Hotkeys:** Full system-level keyboard control designed to integrate cleanly with any workflow (see the [Keyboard Shortcuts Reference](#-keyboard-shortcuts-reference) below).
* **Automated Lock Integration:** Accelerators and hotkeys are temporarily disabled at the OS level during active network downloads or response generation, preventing accidental double-submits or state conflicts.
* **Visual Help Map:** Summon a clean, native keyboard shortcuts cheatsheet window using standard GTK keybindings or the application menu.

### 📂 Session Intelligence
* **Blazing Fast Chat Search:** Instantly query your conversation list using an efficient, in-memory session cache.
* **Disk Auto-Save:** Automatically serializes chat histories to disk so you never lose your conversations.
* **Defensive Resource Safety:** Monitors local RAM using `psutil` before loading a model, preventing desktop freezes by warning you if your hardware resources are too low.

---

## 🎹 Keyboard Shortcuts Reference

Navigate and operate FastFlowLM-gtk entirely from your keyboard:

| Shortcut | Action | Description |
| :--- | :--- | :--- |
| `Ctrl + N` | **Start New Chat** | Resets the conversation window and highlights the model selector. *(Locked during active generation)* |
| `Ctrl + F` | **Search Chats** | Focuses the sidebar search input. Automatically slides the sidebar open if it was hidden. |
| `F9` | **Toggle Sidebar** | Collapses or expands the historical chat sessions sidebar panel. |
| `Ctrl + Shift + C` | **Copy Last Response** | Instantly copies the most recent AI assistant message to your clipboard. |
| `Ctrl + ?` or `Ctrl + /` | **Help Overlay** | Displays the native keyboard shortcut reference window. |
| `Enter` (or Numpad Enter) | **Send Message** | Sends your current input buffer and any attached files. |
| `Shift + Enter` | **Insert Newline** | Inserts a newline character (`\n`) at the current text cursor position without sending. |

---

## 📂 File & Storage Layout

FastFlowLM-gtk respects Linux XDG storage specifications, ensuring that all data is sandboxed cleanly inside a dedicated configuration folder in your home directory.

All runtime information, configs, and downloaded parameters are written to **`~/.config/flm/`**:

| Folder / File Path | Description |
| :--- | :--- |
| `~/.config/flm/history/` | Contains your serialized JSON chat sessions. Files are indexed dynamically by session timestamp keys. |
| `~/.config/flm/models/` | Where downloaded model weight bin files are cached locally. |
| `~/.config/flm/theme.json` | Stores your custom user interface theme preferences and accent color overrides. |
| `~/.config/flm/server.log` | Captured background output and execution diagnostics for the local inference engine. |
| `~/.config/flm/model_ram.lock` | Safety state marker used by the pre-flight checks to prevent multi-allocating overlapping memory pages. |

---

## 🏗 Architectural Blueprint

The application follows a clean, modular pythonic layout designed to keep the interface responsive, lightweight, and easy to extend:

* **`app.py`**: The application entry point. Handles initial GLib application lifecycle setup and hooks the window activate signal.
* **`main.py`**: The central orchestrator. Configures application window actions, binds system-wide hotkeys, handles model registries, monitors RAM thresholds, and tracks active downloads.
* **`ui.py`**: Builds the Libadwaita layout structure, including the edge-to-edge sidebars, headers, status welcome screens, and adaptive options dropdown menus.
* **`handlers.py`**: Manages interactive callbacks—such as keypress listeners, click operations, file attachments, and VLM input validations.
* **`display.py`**: Renders custom conversation bubbles. Converts raw markdown text to Pango markup and attaches interactive code-copy buttons inside the UI.
* **`models.py`**: Defines the local model registry, manages system RAM requirements, and coordinates downloads or file repairs.
* **`network.py`**: Manages background API client sockets and communication streams with the local LLM server.
* **`sessions.py`**: Manages session serialization and deserialization, writing JSON histories to local storage.
* **`theme.py`**: Ensures visual adaptiveness, interfacing with the Adw Style Manager to seamlessly match dark/light theme options.
* **`utils.py`**: Practical utility functions handling path operations, file logs, and system validation rules.

---

## 📦 Installation & Setup

FastFlowLM-gtk offers several installation tracks to support different user preferences and Linux environments.

### 📋 Phase 0: Resolve System Dependencies
This application is developed and tested officially on **Arch Linux**. Your system must have the core library dependencies for GTK 4, Libadwaita, GtkSourceView 5, and image formatting installed:

* **Arch Linux / Artix:**
  ```bash
  sudo pacman -S gtk4 libadwaita gtksourceview5 libsoup3 python-gobject webp-pixbuf-loader python-psutil imagemagick
  ```

* **Core Inference Engine (Python Package):**
  Install the main background server engine wrapper:
  ```bash
  pip install --user fastflowlm
  ```

---

### Track 1: Arch Linux AUR - Package Helper (Primary Method)
If you are on Arch Linux, this is the **recommended** way to install the app. Using an AUR helper like `yay` automates downloading, dependency resolution, icon registration, desktop menu integration, and future package updates.

```bash
yay -S fastflowlm-gtk
```

---

### Track 2: Arch Linux AUR - Manual Build (Secondary Method)
If you prefer to audit or manually build packages from the AUR without a wrapper helper, you can build the native Arch `.pkg.tar.zst` file yourself using `makepkg`.

1. **Clone the AUR package repository:**
   ```bash
   git clone https://aur.archlinux.org/fastflowlm-gtk.git
   cd fastflowlm-gtk
   ```

2. **Build and Install:**
   Compile and register the system files, resolving dependencies recursively (`-s`) and installing system-wide (`-i`):
   ```bash
   makepkg -si
   ```

---

### Track 3: System-wide Manual Installation Script (Third Method)
If you want a system-wide installation but are not utilizing package databases, you can use the manual installation script provided in this repository.

1. **Clone the application repository:**
   ```bash
   git clone https://github.com/marleylinux/FastFlowLM-gtk
   cd FastFlowLM-gtk
   ```

2. **Execute the Installation Script as Root:**
   The script automates copying files to `/usr/share/fastflowlm-gtk`, compiling a `/usr/bin/` launcher wrapper, formatting branding assets, and setting up desktop entries.
   ```bash
   sudo ./install.sh
   ```

---

### Track 4: Portable Standalone Run (Developer & Fast Mode)
If you prefer not to touch your system folders, do not have root access, or want to test/develop new features immediately, you can run FastFlowLM-gtk portably directly out of the repository directory.

1. **Clone the repository:**
   ```bash
   git clone https://github.com/marleylinux/FastFlowLM-gtk
   cd FastFlowLM-gtk
   ```

2. **Launch directly:**
   Execute `app.py` directly using Python. The application runs portably, loading locally while writing all sandbox configs cleanly to `~/.config/flm/`:
   ```bash
   python app.py
   ```

---

## 🔧 Deep Troubleshooting & Tips

* **Missing WebP Icons / Visual Glitches:** If model logos or icons fail to display, ensure `webp-pixbuf-loader` is installed on your host system and restart your desktop session. This package allows GTK's pixbuf libraries to parse `.webp` images.
* **Corrupted or Interrupted Model Downloads:** If a model download gets interrupted or fails to load, click the **Repair** (refresh) icon in the top header bar to purge local model files and trigger a clean re-download.
* **Why are my hotkeys or inputs locked?** When downloading a model or actively streaming an AI response, the interface safely locks the inputs and disables hotkeys. This is a design feature that prevents server request overlaps and maintains database stability.
* **Memory Protection Alerts:** If a warning popup prevents you from loading a model, your system RAM is running too low. The client dynamically queries your hardware stats via `psutil` to verify your RAM meets the safety requirements for the model's parameters before loading.

---

## 🤝 Contribution & Feedback

This application is an open-source hobby project designed, developed, and maintained by a single person to provide a superior native desktop chat experience. 

If you find a bug, have an idea for an enhancement, or want to contribute code:
* **Pull Requests:** Open a PR containing your changes.
* **Issues:** Submit bug reports or requests on the official GitHub repository.
* **Direct Feedback:** Reach out directly at `warburtonmarley@proton.me`.

*Powered by [FastFlowLM](https://github.com/FastFlowLM/FastFlowLM).*
