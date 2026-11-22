# code-remove-copilot-hook

A simple Pacman hook for Arch-based Linux distros that automatically removes the bundled Copilot extension from Visual Studio Code after installation or upgrade.

## Description

Visual Studio Code bundles the GitHub Copilot extension in its installation directory. This package installs a Pacman hook that automatically removes the bundled Copilot extension whenever a supported VS Code package is installed or upgraded.

Supported packages:

- `code`
- `visual-studio-code-bin`
- `visual-studio-code-insiders-bin`

The hook runs **after** the package transaction completes and removes the **Copilot** extension directory.

## Installation

### From the AUR

Using an AUR helper such as `yay`:

```bash
yay -S code-remove-copilot-hook
```

Or using `paru`:

```bash
paru -S code-remove-copilot-hook
```

### Manual installation

Clone the repository:

```bash
git clone https://github.com/pavloskafritsas/code-remove-copilot-hook.git
cd code-remove-copilot-hook
```

Build and install the package:

```bash
makepkg -si
```

## How It Works

The package installs the following Pacman hook:

```ini
/etc/pacman.d/hooks/code-remove-copilot-hook.hook
```

The hook is triggered when any of the supported VS Code packages is `installed` or `upgraded`.

After the transaction completes, it executes:

```bash
rm -rf /usr/share/code/resources/app/extensions/copilot
rm -rf /usr/share/code-insiders/resources/app/extensions/copilot
```

This removes the bundled Copilot extension from the corresponding installation directories.

**Note:** The hook only removes the bundled extension directories. It **does not** remove separately installed Copilot extensions from individual VS Code user profiles.

## Uninstallation

Remove the package using:

```bash
sudo pacman -R code-remove-copilot-hook
```

Removing the package also removes the installed Pacman hook, preventing it from running in future transactions.

## License

This project is licensed under the GNU General Public License v3.0 or later.
See [LICENSE](LICENSE) for details.