Here is the complete guide on how to install dependencies across different Linux distributions and how to use the SuyoraTex Live Editor.

---

# 🚀 SuyoraTex Installation Guide

To run this application, your system needs two things:

1. **A LaTeX Distribution** (so your computer has the `pdflatex` command).
2. **Python Dependencies** (`PyQt6` for the GUI and `PyMuPDF` for PDF rendering).

### 1. Install LaTeX on Your Distribution

Open your terminal and run the command for your specific Linux distribution:

**Ubuntu / Debian / Linux Mint / Pop!\_OS:**

```bash
sudo apt update
sudo apt install texlive-latex-base texlive-latex-extra texlive-fonts-recommended
```

_(Optional: If you have plenty of storage and want every LaTeX package ever made, install `texlive-full` instead)._

**Fedora / Rocky Linux / RHEL:**

```bash
sudo dnf install texlive-scheme-basic texlive-collection-latexextra texlive-collection-fontsrecommended
```

**Arch Linux / Manjaro / EndeavourOS:**

```bash
sudo pacman -S texlive-basic texlive-latex texlive-latexextra texlive-fontsrecommended
```

**openSUSE:**

```bash
sudo zypper install texlive-latex texlive-latexextra
```

### 2. Install Python Dependencies

Because modern Linux distributions block installing global Python packages via `pip` (to prevent breaking system tools), the best way to run this is using a **virtual environment** or using **`uv`** (which you are already using!).

**Method A: Using `uv` (Recommended for you)**
Since you have `uv` installed, navigate to the folder containing `main.py` and run:

```bash
uv venv
uv pip install PyQt6 PyMuPDF
uv run main.py
```

**Method B: Standard Python Virtual Environment**

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install PyQt6 PyMuPDF
python main.py
```

---

# 📖 How to Use SuyoraTex

SuyoraTex is designed to be completely frictionless. Here is how to get the most out of it:

### The Welcome Screen

When you launch the app, you are greeted by the Welcome Screen.

- **Theme Switcher (Top Right):** Instantly swap between Tokyo Night, Dark, Light, Green, and Neobrutalism.
- **Create New:** Opens a fresh workspace with a default LaTeX template ready to go.
- **Open File:** Opens the custom File Explorer to find an existing `.tex` file.

### The Workspace

The workspace is split into three main areas. You can **drag the lines** separating them to resize the panels to your liking.

1. **The Sidebar (Left)**
   - **Navigation:** Return Home, Create New, Open, Save, or Export PDF.
   - **Live Theme Switcher:** Change the app's look on the fly while you are working.
2. **The Editor (Middle)**
   - Type your LaTeX code here.
   - **Auto-Compile:** You do not need to press a compile button! When you stop typing for `0.8` seconds, the app automatically compiles your code in the background.
   - **Word Wrap:** Text automatically wraps, so you never have to scroll horizontally if you shrink the window.
3. **The Live Viewer (Right)**
   - Instantly displays the rendered PDF.
   - Use the Zoom toolbar at the top to zoom in/out or reset the view.

### The Custom File Explorer

Instead of using your standard, boring system file picker, SuyoraTex uses a custom theme-aware file explorer.

- **Navigation:** Double-click folders to enter them, or click "⬆ UP DIR" to go back.
- **Smart Typing:** When saving a file, just type the name (e.g., `my_assignment`). The app will automatically append `.tex` or `.pdf` for you!

### Status Bar indicators

Look at the bottom of the text editor. It tells you exactly what the compiler is doing:

- 🟡 **WAITING/COMPILING:** You are typing, and the background compiler is running.
- 🟢 **SUCCESS:** Your document compiled perfectly.
- 🟠 **WARNING:** The document compiled, but LaTeX found syntax errors or missing packages (check your math equations or missing `\usepackage{}`).
- 🔴 **FATAL ERROR:** The document crashed and could not produce a PDF. (Usually a missing `\end{document}` or a catastrophic syntax error).

### ⌨️ Keyboard Shortcuts

For maximum productivity, you don't need to use your mouse:

| Shortcut         | Action                                                                      |
| :--------------- | :-------------------------------------------------------------------------- |
| **`Ctrl` + `S`** | **Save** your `.tex` file.                                                  |
| **`Ctrl` + `P`** | **Export PDF** (Saves the rendered document as a `.pdf` anywhere you want). |
| **`Ctrl` + `+`** | **Zoom In** the PDF viewer.                                                 |
| **`Ctrl` + `-`** | **Zoom Out** the PDF viewer.                                                |
| **`Ctrl` + `0`** | **Reset Zoom** to default.                                                  |

### 💡 Pro-Tip for Images

If your LaTeX document uses images (e.g., `\includegraphics{my_graph.png}`), simply put the image in the **same folder** as your saved `.tex` file. When you open the `.tex` file in SuyoraTex, the background compiler automatically sets its working directory to that folder, so it will find your images perfectly!
