# 🌲 Treex  
### *Tree Explorer — A colorful, fast, and customizable CLI directory viewer*

> **Treex** (Tree Explorer) is a lightweight and modern command-line utility  
> that lets you explore your file system visually — with colors, file sizes, line counts,  
> summaries, and full configuration support.

---

## 🧭 Name Origin

**Treex** = **Tree** + **Explorer**  
That little **“x”** stands for *exploration* — the extra step beyond the classic `tree` command.  
It’s fast, flexible, and designed for developers who live in the terminal.

---

## ⚡ Features

- 🖍️ Colorized directory and file tree (configurable via `~/.config/treex/treex.conf`)
- 📁 File and folder size display
- 📄 Count total lines in source files
- 🕒 Show last modification time
- 🧮 Summary statistics and extension distribution
- 🧰 Export tree output (cleaned of ANSI codes)
- 🪶 Customizable color scheme for each file type
- 🧊 Works on **Arch Linux** and **Debian-based** systems

---

## 🧩 Example Output

```

project/
├── main.py (12 KB) [340 lines]
├── README.md (2 KB)
└── data/
├── input.txt (8 KB)
└── output.log (1 KB)

Summary:
Total files: 5
Total lines: 420
Total size: 23 KB

````

---

## ⚙️ Installation

### 🟢 Arch Linux (PKGBUILD)

Clone the repository and build the package:

```bash
git clone https://github.com/herdem09/treex.git
cd treex
makepkg -si
````

Then simply run:

```bash
treex
```

---

### 🟣 Debian / Ubuntu (.deb)

If you downloaded the `.deb` package from [Releases](https://github.com/herdem09/treex/releases):

```bash
sudo dpkg -i treex_1.0.0-1_all.deb
```

Then run:

```bash
treex
```

---

## ⚙️ Configuration

Treex uses a configuration file located at:

```
~/.config/treex/treex.conf
```

Example structure:

```
~/.config/
└── treex/
    └── treex.conf
```

Example config content:

```ini
# Primary color (used if no specific color is defined)
primary = 37   # White

# Folder color
folder = 34    # Blue

# File type colors
.py = 32       # Green
.md = 36       # Cyan
.sh = 33       # Yellow
.txt = 37      # White
.log = 35      # Magenta
.conf = 36     # Cyan
```

---

## 🖥️ Usage

Run `treex` in any directory:

```bash
treex
```

Show hidden files:

```bash
treex -a
```

Show file sizes and line counts:

```bash
treex --size --lines
```

Limit directory depth:

```bash
treex --depth 2
```

Export output (without color codes):

```bash
treex -ex output.txt
```

Show summary and extension distribution:

```bash
treex --summary --extdist
```

---

## 📦 Package Info

| Field          | Value               |
| -------------- | ------------------- |
| **Name**       | treex               |
| **Version**    | 1.0.0               |
| **Language**   | Python 3            |
| **Platform**   | Arch Linux / Debian |
| **License**    | MIT                 |
| **Maintainer** | herdem09            |

---

## 🧑‍💻 Maintainer

**herdem09**
📧 [herdem09@proton.me](mailto:herdem09@proton.me)
🔗 [https://github.com/herdem09/treex](https://github.com/herdem09/treex)

---

## 📜 License

Licensed under the **MIT License** — free to use, modify, and distribute.

---

> “A tiny ‘x’ can turn a simple tree into an explorer.”
> — *Treex, v1.0.0*
