# NerdFonts Installer

This repository contains a POSIX-compliant shell script (`nerdfonts_installer.sh`) for downloading and installing a selection of popular Nerd Fonts on Linux systems. The script automatically detects the operating system, installs necessary dependencies, and provides a user-friendly menu to select and install the desired fonts.

Additionally, the compiled binary version of the script (`nerdfonts-installer`) created using `shc` allows you to run the installer without needing to interpret the script.

---

## Features

- Detects the operating system and selects the appropriate package manager.
- Installs dependencies (`curl`, `tar`, `fontconfig`) if not already present.
- Provides a list of Nerd Fonts to choose from, displayed in a paginated three-column format.
- Downloads and installs selected fonts into `~/.local/share/fonts`.
- Updates the font cache automatically.

---

## Usage

### 1. Using the Shell Script

#### Prerequisites

- A POSIX-compliant shell.
- `curl`, `tar`, and `fontconfig` installed on your system (the script installs these automatically if missing).

#### Running the Script

1. Clone or download the script:

   ```sh
   git clone https://github.com/fam007e/nerd_fonts_installer.git
   cd nerd_fonts_installer
   ```
2. Make the script executable:
   ```sh
   chmod +x nerdfonts_installer.sh
   ```
3. Run the script:
   ```sh
   ./nerdfonts_installer.sh
   ```

   
4. Follow the prompts to select and install fonts.

### 2. Using the Binary (`nerdfonts-installer`)

If you have the precompiled binary, you can run it directly:

1. Move the binary to your desired directory:
   ```sh
   mv release/nerdfonts-installer /usr/local/bin/
   ```
2. Make it executable if needed:
   ```sh
   chmod +x /usr/local/bin/nerdfonts-installer
   ```
3. Run the binary:
   ```sh
   nerdfonts-installer
   ```
The binary version works exactly like the shell script and does not require any shell interpretation.

### 3. Or, run it directly from the terminal `shell`

- Download and run the Installer Script:
   ```sh
   curl -sS https://raw.githubusercontent.com/fam007e/nerd_fonts_installer/main/nerdfonts_installer.sh | sh
   ```  
- Alternatively, you can download and execute the precompiled binary:
   ```sh
   curl -sSLo nerdfonts-installer https://github.com/fam007e/nerd_fonts_installer/blob/main/release/nerdfonts-installer && chmod +x nerdfonts-installer && ./nerdfonts-installer
   ```

## Customization

The script can easily be modified to add additional fonts. To add a font:
1. Edit the fonts variable in the script.
2. Add the new font name to the list in the same format as the others.

## License
This project is licensed under the [MIT License](LICENSE).

## Contributions
Feel free to open issues or submit pull requests for improvements, bug fixes, or additional fonts!

## Credits
Special thanks to awesome [@ryanoasis](https://github.com/ryanoasis) repo [`nerd-fonts`](https://github.com/ryanoasis/nerd-fonts).
