# ForgeFoundary

A flexible, framework-agnostic scaffolding tool for any programming language or architecture.

## Key Features

- Multi-language support: Scaffold projects in any language by defining your own modes.
- Customizable modes: Each mode defines directory structures, templates, naming conventions, and scaffolding rules.
- CLI-driven workflow: Easily scaffold components, directories, and units from the command line.
- Template engine support: Use Mustache, Twig, or Blade-style templates.
- Pre- and post-scaffold hooks: Run custom commands automatically before or after scaffolding.
- Portable and framework-agnostic: Not tied to any specific framework or programming style.

## How It Works

### ForgeFoundary reads configuration from YAML mode files, which define:

- Component paths and names
- Directory structures and units
- Template files, placeholders, and extensions
- Naming conventions (PascalCase, camelCase, etc.)
- CLI flags and overrides for flexible scaffolding

## Philosophy

ForgeFoundary is designed for developers who value automation, consistency, and flexibility in project setup. By separating scaffolding logic into configurable modes, it ensures repeatable and predictable project structures, no matter the language, framework, or team.

## Installation Options
### Manual Installation (Directly from the installation script)

You can fetch the installation script directly from the repository and run it. This works on Unix/Linux/macOS and Windows.

#### Unix / Linux / macOS
```bash
curl -o install.sh https://raw.githubusercontent.com/omarSemgey/ForgeFoundary/main/InstallationScripts/install.sh
chmod +x install.sh
./install.sh
```

The script will:

Ask for the installation directory (default: ~/ForgeFoundary).

Clone the ForgeFoundary repository to the specified folder.

Install PHP dependencies using Composer.

Attempt to make the ForgeFoundary command available globally (requires write access to /usr/local/bin).

If the script cannot link globally, you can manually add the install directory to your PATH.

---

#### Windows
```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/omarSemgey/ForgeFoundary/main/InstallationScripts/install.ps1" -OutFile "install.ps1"
Set-ExecutionPolicy Bypass -Scope Process -Force
.\install.ps1
```

The script will:

Ask for the installation directory (default: $HOME\ForgeFoundary).

Clone the ForgeFoundary repository to the specified folder.

Install PHP dependencies using Composer.

Optionally guide you to make ForgeFoundary accessible globally.

### Automatic Installation via Package Managers

ForgeFoundary can also be installed using the following package managers. Note: Package managers currently install ForgeFoundary to the default path, and it may not prompt for a custom installation directory.

#### Composer (Global)

composer global require omarsemgey/forgefoundary


After installation, ensure ~/.composer/vendor/bin (Linux/macOS) or %USERPROFILE%\AppData\Roaming\Composer\vendor\bin (Windows) is in your PATH.

#### AUR / yay (Arch Linux)

```bash
yay -S forgefoundary
````

---

## Quick Start
```bash
ForgeFoundary dry-run
```

## Further Instructions

For detailed instructions, examples, and a map of available documentation, refer to the [Docs](https://omarsemgey.github.io/ForgeFoundary/Manual/). it provides an organized overview of all other documentation files included with ForgeFoundary.
