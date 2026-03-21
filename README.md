# Media Archive Organizer

<img src="src/assets/icon.png" align="right" width="140" alt="Media Archive Organizer Icon">

**Automated Media Organization & AI Cleanup Tool**

[![Version](https://img.shields.io/badge/version-v3.0.9-blue.svg)](https://github.com/Undadfeated/Media_Archive_Organizer/releases)
[![Python](https://img.shields.io/badge/python-3.11_%E2%80%93_3.14_tested-brightgreen.svg)](https://www.python.org/)

---

## Overview

> [!NOTE] 
> **v3.0.9 is the first stable public release.** Previous versions in the changelog represent rapid development iterations leading to this milestone.

Media Archive Organizer is a powerful application designed to help you organize digital chaos. It automatically sorts your photos and videos into a structured `Year/Year-Month` format using EXIF metadata and smart filename parsing, and leverages on-device AI to help filter family photos from miscellaneous images.

**Developer**: [Undadfeated](https://github.com/Undadfeated)

## Screenshots

![Application Interface](src/assets/screenshot.png)
<!-- slide -->

## Key Features

### 📁 Smart Organization

- **Flexible Sorting**: Choose between flat `YYYY-MM` folders or nested `YYYY/YYYY-MM` structures.
- **Robust Date Extraction**: Pulls dates from standard EXIF metadata. If missing, automatically falls back to smart regex parsing for downloaded media (e.g., WhatsApp, Signal, iOS naming conventions) or file creation/modification dates.
- **Automated Standard Naming**: Formats files with chronological `YYYY-MM-DD_` prefixes automatically. It also corrects files with previously mangled date prefixes.
- **Safe Deduplication**: Protects against accidental overwrites. If an identical file name is processed, the system compares file sizes and MD5 chunk hashes to definitively identify and skip duplicates, or uniquely rename collisions.

### 🤖 AI Media Scanner

- **Privacy-First AI Filtering**: Want to back up family photos but discard memes, screenshots, and landscapes? The AI Scanner uses an embedded TensorFlow Lite machine learning model to rapidly analyze images fully locally. No data leaves your machine.
- **Pet Detection**: Built-in toggle to optionally keep photos containing dogs, cats, and common pets alongside human subjects.
- **High-Performance Pipeline**: Designed around a producer-consumer backend thread architecture, ensuring rapid background scanning that never freezes the user interface.

### ⚙️ Seamless Interface

- **Optimized Image Selection**: Integrated preview window dynamically loads optimized thumbnails on background threads, eliminating UI lag when reviewing hundreds of high-res images.
- **Real-Time Auditing**: A dedicated log console provides live visibility of all background file operations, movements, and modifications.
- **In-App Updater**: The app automatically checks GitHub for new releases on startup. If an update is available, it displays the latest changelog notes and opens the GitHub Releases page so you can download or build the latest version.

## Installation & Usage

### Windows

To use this application on Windows, you can clone the repository and build the executable.

1. Clone or download this repository to your local machine.
2. Ensure you have **Python 3.11+** installed.
3. Open a terminal in the folder and install dependencies: `pip install -r requirements.txt`.
4. Run `build_exe.bat` to compile the application.
5. The standalone executable will be generated inside the `dist/` folder.

> **Note on File Size (~87MB)**: The Windows executable includes a complete Python 3.11 runtime, CustomTkinter libraries, OpenCV, and pre-trained AI models.

### Linux / Arch Linux

On Linux, you run the application from source.

```bash
# Clone the repository
git clone https://github.com/Undadfeated/Media_Archive_Organizer.git
cd Media_Archive_Organizer

# Create and activate a Python virtual environment (Recommended for CachyOS/Arch Linux)
python -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the application
python launcher.py
```

*For Arch Linux Users:* An AUR package `mediaarchiveorganizer` is available. You can easily install and maintain it using an AUR helper like `yay`:

```bash
yay -S mediaarchiveorganizer
```

## Development & Testing

If you want to run the application from source code directly on any platform, this project requires **Python 3.11+**. Launch it via `python launcher.py`.

## Credits

- **[MediaPipe / TensorFlow Lite](https://developers.google.com/mediapipe)** for embedded object detection architecture and face detection models.
- **[OpenCV](https://opencv.org/)** for image processing.
- **[CustomTkinter](https://github.com/TomSchimansky/CustomTkinter)** for the modern aesthetic UI framework.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---
*If this tool saved you time organizing your archives, consider supporting the development!* ☕
