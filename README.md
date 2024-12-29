# swiftfetch

**swiftfetch** is a fast and simple system information fetch tool written in Rust. It displays various system information like OS, CPU, RAM usage, uptime, and more in a neat, customizable format.

## Features

- Displays essential system information like OS, kernel version, CPU, RAM usage, and more.
- Easy to configure and extend.
- Simple, fast, and lightweight.

## Installation

To install swiftfetch, use the following command from the root of the project:

`cargo install --path .`

This command will install the program and automatically copy the default config.toml to ~/.config/swiftfetch/config.toml.

## Configuration

The configuration file can be found at `~/.config/swiftfetch/config.toml`, you can customize it to display or hide specific information based on your preferences.

If you did not set $EDITOR then it will return `nano` as default. Most DEs do that by default afaik, might have to add it yourself for WMs
Here is the default `config.toml` that will be copied automatically:

```
# These are the only options for now, I'll add some more later on.
# You can just remove whatever you want.

[display]
user_host_format = "{username}@{hostname}"
os = "OS"
kernel = "Kernel"
cpu = "CPU"
wm = "WM"
packages = "PKGS"
flatpak = "FLAT"
ram = "RAM"
uptime = "Uptime"
os_age = "Age"
editor = "Editor"

separator = ": "

order = [
    "os",
    "kernel",
    "cpu",
    "wm",
    "packages",
    "flatpak",
    "ram",
    "uptime",
    "os_age",
    "editor",
]
```

## Configuration Options

- `user_host_format`: Defines the format for displaying the username and hostname (e.g., {username}@{hostname}).
- `os`, `kernel`, `cpu`, `wm`, `packages`, `flatpak`, `ram`, `uptime`, `age`: These are the fields displayed by swiftfetch. You can set them to any string, or remove any that you don't need.
- `separator`: Defines the separator between the label and value (e.g., ": ").
- `order`: Defines the order in which the information is displayed. You can reorder or remove items from this list.


## Example Output

```

lysec@archlinux

󰣇 ‣ os: Arch Linux
󰍛 ‣ kernel: 6.12.7-2-cachyos
󰍛 ‣ cpu: AMD Ryzen 7 7800X3D 8-Core Processor
 ‣ wm: Hyprland
 ‣ pkgs: 947
󰓅 ‣ ram: 6.40 GB / 30.51 GB
 ‣ uptime: 2h 29m
 ‣ age: 10 day(s)
 ‣ shell: fish
 ‣ term: ghostty

```

## Contributing

If you'd like to contribute to swiftfetch, feel free to fork the repo and submit a pull request. Contributions are always welcome!

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
