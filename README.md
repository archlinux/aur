# Minecraft-ModM
A CLI tool for managing Minecraft mods/plugins for servers.
## About
This project targets server owners, because it might be hard to install mods/plugins in a CLI server interface. I had that problem, and I hated when I had to update my server. So, this is the solution.
## Dependencies
- [libcurl](https://curl.se/libcurl/) (for downloading mods/plugins)  
- A C++ compiler with C++20 support (e.g., `g++`)  
- `make` utility
- nlohmann/json library
## Binary name
This project's binary is called 
```bash
mcmodm
```
## Installation
In order to install this program, you should download a file from `releases` section.
Then, you have to install the program. Installation is different for both Windows and Linux users.
### Windows
1. Download .exe file
2. Double-click the file
3. Follow installation guide
4. Run cmd.exe or something
5. run
 ```cmd
 cd "C:\Program Files\mcmodm\"
 ```
6. Run file
### Linux (Debian)
1. Download `.deb` file
2. Run
  ```bash
dpkg-deb -i mcmodm.deb
```
3. Simply run `mcmodem <option>`
## Setting up
1. To create a version file, run
```bash
mcmodm setup <path> <version> <loader>
```
2. You are ready 
## Usage
Commands:
- Search for mod/plugins: `mcmodm <mod/plugin name>
- Then, use project ID and run `mcmodm install <Project ID> (Project ID ) <Install Path>`. Dependencies will be installed. Multiple packages could be installed.
- List installed plugins: `mcmodm list <Install path>`
- Remove mod/plugin: `mcmodm remove <Project ID> (Project ID ) <Install Path>`. Just specified package will be removed
- Update all packages: `mcmodm updateall <new Game version> <Install path>`
- Install packages easily (follow instructions that appear): `mcmodm easy_install <path>`
- Remove packages easily (follow instructiosn that appear): `mcmodm easy_remove <path>`
- Install all packages from a file: `mcmodm iff <path_to/packages.json>`<install-path>`
- Check if all of installed packages are available for updating to a specific version and loader: `mcmodm ck_upd <update_version> <loader> <installation_folder>`
- Install from a local .jar file: `mcmodm il <file_to_install> <path_to_install - destination> <name>`
## Compiling yourself
There is a Makefile. Use `make` to compile on Linux/macOS, `sudo make install` to install system-wide. Source files are in src/ and header files are in include/
On WIndoes, steps are simmilar after installing dependencies, using a MINGW64 shell.
