# WPM - Waypoint Manager

WPM is a lightweight command-line tool designed to help you manage frequently used directories with ease. It allows you to save your current directory as a "waypoint" and then quickly jump back to it later. This canvas provides all the details for installing and using WPM via the AUR and through manual installation using the provided install script.

---

## Features

- **Set a Waypoint:** Save your current directory under a custom name.
- **Go to a Waypoint:** Retrieve and navigate to a saved directory.
- **List Waypoints:** Display all saved waypoints along with their corresponding directories.

---

## Installation via the AUR

WPM is available on the Arch User Repository (AUR). To install it using your favorite AUR helper, run:

```bash
yay -S wpm
```

> **Note:** The AUR package includes an install script (`wpm_install.sh`) that handles compilation and installation of the executable and associated files.

---

## Manual Installation Using the Install Script

If you prefer to install WPM directly from source using the install script, follow these steps:

1. **Download the Source Tarball:**  
   Obtain the source tarball (e.g., `wpm-1.0.0.tar.gz`) from the [GitHub releases page](https://github.com/yourusername/wpm/releases).

2. **Extract the Tarball:**
    ```bash
    tar -xzvf wpm-1.0.0.tar.gz
    cd wpm-1.0.0
    ```

3. **Run the Installation Script:**
    ```bash
    chmod +x wpm_install.sh
    ./wpm_install.sh
    ```
   The install script will:
   - Compile `wpm.c` into the `wpm` executable.
   - Move the executable to `/usr/local/bin`.
   - Install the shell wrapper script (`wpm.sh`) to `/etc/profile.d/wpm.sh`.
   - Update your shell configuration if necessary.
   - Inform you when the installation is complete.

---

## Post-Installation Shell Configuration

WPM installs a shell wrapper script at `/etc/profile.d/wpm.sh`. Most systems automatically source files in `/etc/profile.d` on login. However, if your shell doesn't, you should add the following line to your shell configuration:

- **For Bash (`~/.bashrc`):**
    ```bash
    source /etc/profile.d/wpm.sh
    ```
- **For Zsh (`~/.zshrc`):**
    ```bash
    source /etc/profile.d/wpm.sh
    ```

After updating your configuration, restart your terminal or run:

```bash
source ~/.bashrc  # or source ~/.zshrc
```

---

## Usage

Once installed, you can use the `wpm` command as follows:

- **Set a Waypoint:**
    ```bash
    wpm set <waypoint_name>
    ```
  This command saves your current directory with the specified waypoint name.

- **Go to a Waypoint:**
    ```bash
    wpm go <waypoint_name>
    ```
  This command navigates to the directory associated with the waypoint.

- **List Waypoints:**
    ```bash
    wpm list
    ```
  This command lists all saved waypoints and their corresponding directories.

---