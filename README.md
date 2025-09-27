# NerdFonts Installer

This repository contains a C program (`nerdfonts-installer`) for downloading and installing a selection of popular Nerd Fonts on Linux systems. The program automatically detects the operating system, installs necessary dependencies, and provides a user-friendly menu to select and install the desired fonts. This C implementation offers improved stability and performance compared to a shell script.

---

## Features

- Detects the operating system and selects the appropriate package manager. Currently supports Arch, Debian, Ubuntu, Fedora, Centos, Red Hat, and Linux Mint.
- Installs dependencies (`curl`, `unzip`, `fontconfig`) if not already present.
- Provides a list of Nerd Fonts to choose from, displayed in a paginated three-column format.
- Downloads and installs selected fonts into `~/.local/share/fonts`.
- Updates the font cache automatically.

---

## Usage

To use the `nerdfonts-installer` C binary:

1. Move the binary to your desired directory (e.g., `/usr/local/bin/`):
   ```sh
   mv release/nerdfonts-installer /usr/local/bin/
   ```
2. Make it executable:
   ```sh
   chmod +x /usr/local/bin/nerdfonts-installer
   ```
3. Run the installer:
   ```sh
   nerdfonts-installer
   ```

### Run directly from the terminal

You can download and execute the precompiled binary directly:
   ```sh
   curl -sSLo nerdfonts-installer https://github.com/fam007e/nerd_fonts_installer/releases/latest/download/nerdfonts-installer && chmod +x nerdfonts-installer && ./nerdfonts-installer
   ```

## Installation from Arch AUR

<table>
<tr>
<td>

Nerd Fonts Installer is also available as a package in various repositories:

[![Packaging status](https://repology.org/badge/vertical-allrepos/nerdfonts-installer.svg)](https://repology.org/project/nerdfonts-installer/versions)

</td>
<td>
<img src="https://github.com/ryanoasis/nerd-fonts/blob/master/images/nerd-fonts-logo.svg" alt="Nerd Fonts logo" width="120">
</td>
</tr>
</table>



## License
This project is licensed under the [MIT License](LICENSE).

## Contributions
Feel free to open issues or submit pull requests for improvements, bug fixes, or additional fonts!

## Credits
Special thanks to awesome [@ryanoasis](https://github.com/ryanoasis) repo [`nerd-fonts`](https://github.com/ryanoasis/nerd-fonts).
