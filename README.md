# u_manag 🛠️

`u_manag` is a lightweight, GUI-based User Management tool for Unix/Linux systems. It provides a simple interface built with `Zenity` to handle common administrative tasks without needing to remember complex CLI flags.

## ✨ Features

- **User Creation:** Add new UNIX users with home directories and passwords.
- **User Deletion:** Securely remove users and their home directories.
- **User Renaming:** Effortlessly change existing login names.
- **GUI-First Design:** Built using `Zenity` for a clean, interactive experience.
- **Root Escalation:** Automatically handles root privileges using `pkexec` (Polkit) for secure graphical password prompts.

## 🚀 Getting Started

### Prerequisites

To run `u_manag`, you need the following dependencies installed:

- `bash`
- `zenity`
- `polkit` (for `pkexec` support)
- `shadow` (standard suite providing `useradd`, `userdel`, `usermod`)

### Installation

#### Arch Linux (using PKGBUILD)
1. Clone this repository.
2. Navigate to the root directory.
3. Build and install the package:
   ```bash
   makepkg -si
   ```

#### Manual Installation (Debian/Ubuntu/Others)
1. Give execution permissions to the script:
   ```bash
   chmod +x u_manag.sh
   ```
2. (Optional) Move it to your path:
   ```bash
   sudo cp u_manag.sh /usr/local/bin/umanag
   ```

## 🛠️ Usage

Simply run the application from your terminal or application launcher:

```bash
umanag
```

The application will prompt for your administrative password via a secure GUI dialog (Polkit) and then open the main management menu.

## 📂 Project Structure

- `u_manag.sh`: The main bash script with `pkexec` support.
- `PKGBUILD`: Arch Linux package build script.
- `umanag.desktop`: Desktop entry for application menu integration.
- `GEMINI.md`: Development context and project notes.

## 📜 License

This project is licensed under the MIT License.
