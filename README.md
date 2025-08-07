# 📦 Rust folder size cli tool

A fast and lightweight folder analyzer written in Rust.  
Recursively calculates the size of directories and files, with support for:

- 🔗 Symlink resolution
- 🗂️ Per-directory size breakdown
- 🔁 Configurable depth limit


## 🛠️ Features

- 📂 Recursively sums up file sizes in a given directory
- 📏 Outputs total size in bytes, KB, MB, and GB
- 🔗 Optional symlink following (`--symlink`)
- 🧱 Shows size of each file or folder (`--directory-b`)
- ⬇️ Limit recursion depth (`--depth-limit <n>`)


## 🚀 Usage

```bash
cargo run -- [OPTIONS]
```
🔧 Options

 Flag	    Description

--symlink:	Follow and resolve symlinks

--directory-b:	Print size breakdown for each directory/file

--depth-limit n:	Limit recursion depth (default: 10)

🔍 Example
```
cargo run -- --symlink --directory-b --depth-limit 5
```
🧪 Sample Output

symlink: true

directory_breakdown: true

depth_limit: 5

../../folder_size

├── bin/         (2.1 MB)

├── lib/         (490.6 MB)

├── LICENSE.txt  (11 KB)

├── README.md    (5 KB)

Total size: 492.3MB

📦 Dependencies

    clap — command-line argument parser

Install them automatically with:
```
cargo build
```
📄 License

MIT License

Made by ven — Rust beginner


