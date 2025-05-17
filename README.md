# 📦 filefetch

**A simple Rust CLI tool to display information about the current folder.**  
Shows the total size, number of files and folders, and prints each entry with a neat emoji.

![Demo](https://raw.githubusercontent.com/yourusername/filefetch/main/assets/demo.gif) <!-- optional -->

---

## 🚀 Features

- 📁 Shows current directory path
- 📦 Displays folder size in MB
- 🔢 Counts files and optionally subdirectories
- 📄 Lists files and folders with colorful output
- 🎛️ Optional flags for no-color or subdirectory counting

---

## 🛠️ Installation

From [crates.io](https://crates.io/crates/filefetch):

```bash
cargo install filefetch
```

*(btw make sure to have cargo installed, it's the package manager for rust)*


## 🧪 Usage
```bash
filefetch
```

# Optional flags:

    --nocolor – disable colored output

    --recursive – count subdirectories in the total file count

    --folder-size - shows folder sizes *(will take longer)*


# 📂 Example Output


```bash
📁 Current Directory: /home/user/projects
📦 Folder Size: 13.42 MB
📦 Number of entries: 8
📄 Files:
•  📁 src
•  📄 Cargo.toml
•  📄 README.md

```
