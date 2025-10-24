# PyOrganize

PyOrganize  is a simple Python script that automatically organizes files in a specified directory into subfolders based on their file types. Keep your directories clean and structured with minimal effort!

## 🗂️ What It Does

PyOrganize scans a given directory and organizes files into categorized subfolders based on their extensions:

| **Category**   | **Example Extensions**         |
|----------------|--------------------------------|
| Images         | .jpg, .png, .gif, .svg        |
| Documents      | .pdf, .docx, .txt, .csv       |
| Audio          | .mp3, .wav, .flac             |
| Video          | .mp4, .mkv, .mov              |
| Archives       | .zip, .tar, .gz, .rar         |
| Scripts        | .py, .sh, .js, .php           |
| Code           | .html, .css, .json, .yaml     |
| Other          | Any file type not categorized  |

## 💡 Example Usage

Run the script to organize your folder:

```bash
python3 main.py ~/Documents
```

This command will:
1. Scan the `~/Documents` folder.
2. Create subfolders like `Images/`, `Documents/`, `Audio/`, etc.
3. Move each file to its corresponding category folder.

**Output Example:**
```
📂 Organizing folder: /home/user/Documents
  ➜ report.pdf → Documents/
  ➜ holiday.png → Images/
  ➜ notes.txt → Documents/
✅ Done organizing!
```

## 🧩 Requirements

- **Python 3.6+**
- No external libraries required — PyOrganize works out of the box!

## 🧠 Notes

- Supports **absolute**, **relative**, or **home (~)** paths.
- Compatible with **Linux**, **macOS**, and **Windows**.
- Optionally, make the script executable for convenience:
  ```bash
  chmod +x main.py
  ./main.py ~/Downloads
  ```

## 🚀 Getting Started

1. Clone or download the script.
2. Place `main.py` in your desired directory.
3. Run the script with a target folder:
   ```bash
   python3 main.py /path/to/your/folder
   ``
## Or direct:
```
git clone https://github.com/ramackersjp/PyOrganize.git
cd ~/PyOrganize
chmod +x main.py
````

Keep your files tidy with PyOrganize 🎉

