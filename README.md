Here’s a refined and comprehensive version of the README:

---

# JetBrains Project Launcher

**JetBrains Project Launcher** is a utility that automatically generates desktop entries for all your JetBrains IDE projects, enabling seamless integration into your desktop environment.

## Features

- Automatically creates desktop entries for JetBrains IDE projects.
- Supports multiple JetBrains IDEs like IntelliJ IDEA, PyCharm, WebStorm, CLion, Rider, and more.
- Automatically monitors project directories for changes (create, delete, move) and updates desktop entries.
- Easy configuration via a simple `.conf` file.
- Works seamlessly with systemd for background service management.

---

## Installation

### Arch Linux

You can install the package using `paru`:

```bash
paru -S jetbrains-project-launcher
```

---

## Setup

### Configuration

After installation, copy the template configuration file to your home directory and edit it to suit your setup:

```bash
cp /usr/share/doc/jetbrains-project-launcher/jetbrains-project-launcher.conf.template ~/.config/jetbrains-project-launcher.conf
nano ~/.config/jetbrains-project-launcher.conf
```

Modify the file to specify the IDEs you want to monitor and their corresponding `original_desktop_entry` files. Example:

```ini
[IdeaProjects]
original_desktop_entry=/usr/share/applications/jetbrains-idea.desktop

[PyCharmProjects]
original_desktop_entry=/usr/share/applications/jetbrains-pycharm.desktop

[WebStormProjects]
original_desktop_entry=/usr/share/applications/jetbrains-webstorm.desktop
```

Ensure that:
- Each IDE has a corresponding section.
- Paths to `original_desktop_entry` files are absolute and valid.
- The section headers match the folder names containing your projects.

---

### Enabling the Service

To enable and start the background service, run:

```bash
systemctl --user enable jetbrains-project-launcher.service
systemctl --user start jetbrains-project-launcher.service
```

---

## Usage

Once the service is running:
- It will automatically create desktop entries for all projects in the configured directories.
- Desktop entries will be stored in `~/.local/share/applications/`.

### Directory Monitoring

The service actively monitors your project directories for:
- **New projects**: Automatically creates a desktop entry.
- **Deleted/moved projects**: Removes the corresponding desktop entry.

---

## Troubleshooting

### Common Issues

#### Missing Desktop Entries
- Ensure the `original_desktop_entry` path in the configuration file is correct.
- Verify that the `original_desktop_entry` file exists on your system.

#### Service Fails to Start
- Check the service logs for errors:
  ```bash
  journalctl --user -u jetbrains-project-launcher.service
  ```

#### Directories Not Found
- Ensure the project directories specified in the configuration file exist.

---

## Uninstallation

To stop and disable the service:
```bash
systemctl --user stop jetbrains-project-launcher.service
systemctl --user disable jetbrains-project-launcher.service
```

To remove the package:
```bash
paru -Rns jetbrains-project-launcher
```

---

## Development

### Building the Package

Clone the repository and build the package using the provided `PKGBUILD`:

```bash
git clone https://github.com/OliverLiebmann/jetbrains-project-launcher
cd jetbrains-project-launcher
makepkg -si
```

---

## License

This project is licensed under the **MIT License**.

---

## Contributing

Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch for your changes.
3. Submit a pull request with a detailed description.

---

Enjoy seamless project management with **JetBrains Project Launcher**! 🚀