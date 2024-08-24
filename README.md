## paxs

`paxs` is a convenient Bash script for searching, installing, removing, and upgrading packages across three different package managers: Yay (Arch Repository + AUR), Flatpak, and Snap.

It streamlines the process of finding, installing, removing, and upgrading packages across multiple package formats with a single command.

### Installation
**Dependencies:** yay, flatpak, snapd

1. **Download the script:**
   ```bash
   git clone https://github.com/zamhedonia/paxs.git
   ```
   
2. **Open the directory:**
   ```bash
   cd ~/paxs
   ```
   
3. **Make it executable:**
   ```bash
   chmod +x paxs
   ```

4. **Copy the script to a directory in your `$PATH` (e.g., `/usr/local/bin`):**
   ```bash
   sudo cp paxs /usr/local/bin/paxs
   ```

5. **Now you can use `paxs` from anywhere in your terminal!**

### Usage

- **Search for a package:**
  ```bash
  paxs <search_term>
  ```
  For example:
  ```bash
  paxs firefox
  ```
  This command will search for the package "firefox" in:
  - Yay (Arch Repository and Arch User Repository)
  - Flatpak
  - Snap

  You'll receive the results from each package manager, one after the other.

- **Install a package:**
  ```bash
  paxs -i <package_name>
  ```
  or
  ```bash
  paxs --install <package_name>
  ```
  This command will search for the package and prompt you to select which source (Yay, Flatpak, or Snap) to install from.
  
- Install packages from specific source:
  ```bash
  paxs -iy <package_name>
  ```
  or
  ```bash
  paxs --install-yay <package_name>
  ```
  
- **Remove a package:**
  ```bash
  paxs -r <package_name>
  ```
  or
  ```bash
  paxs --remove <package_name>
  ```
  This command will search for the package across Yay, Flatpak, and Snap and prompt you to choose which source to remove the package from.
  
- Remove packages from specific source:
  ```bash
  paxs -rf <package_name>
  ```
  or
  ```bash
  paxs --remove-flatpak <package_name>
  ```
  
- **Check for updates across Yay, Flatpak, and Snap:**
  ```bash
  paxs -c
  ```
  or
  ```bash
  paxs --check-update
  ```

- **Upgrade all packages across Yay, Flatpak, and Snap:**
  ```bash
  paxs -u
  ```
  or
  ```bash
  paxs --upgrade-all
  ```

- Upgrade packages from specific source:
  ```bash
  paxs -us
  ```
  or
  ```bash
  paxs --upgrade-snap
  ```

- **Display the help manual:**
  ```bash
  paxs -h
  ```
  or
  ```bash
  paxs --help
  ```

### Example Output

```bash
paxs firefox
```
```bash
Searching for 'firefox' in Yay, Flatpak, and Snap...

Yay search:
firefox 89.0-1 [installed] (mozilla)

Flatpak search:
firefox stable flathub org.mozilla.firefox

Snap search:
firefox (v89.0) mozilla - Firefox Web Browser
```

### Implementation

The program directly executes `yay`, `flatpak`, and `snapd` commands to manage packages, making it a unified interface for Arch-based distributions.
