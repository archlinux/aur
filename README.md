# ntfy-notify-send-bridge

A lightweight bridge to forward messages from [ntfy](https://ntfy.sh/) to `notify-send` for desktop notifications on Linux.

This project provides a Python script and a systemd user service to listen for ntfy messages and display them as native desktop notifications.

## Features

*   Listens to ntfy topics via JSON stream.
*   Executes `notify-send` for incoming messages.
*   Supports ntfy message variables in the `notify-send` command.
*   Configurable via `client.yml` (compatible with official ntfy client config).
*   Runs as a persistent systemd user service.

## Installation (AUR)

This package is available in the Arch User Repository (AUR) as `ntfy-notify-send-bridge-git`.

### Using an AUR Helper (Recommended)

If you have an AUR helper like `yay` or `paru`, you can install it with:

```bash
yay -S ntfy-notify-send-bridge-git
# or
paru -S ntfy-notify-send-bridge-git
```

### Manual Installation

1.  Clone the AUR package:
    ```bash
git clone https://aur.archlinux.org/ntfy-notify-send-bridge-git.git
cd ntfy-notify-send-bridge-git
    ```
2.  Build and install:
    ```bash
makepkg -si
    ```

## Configuration

1. An example configuration file `client.yml.example` is installed to `/usr/share/examples/ntfy-notify-send-bridge-git/`.
2.  Copy this example to your ntfy configuration directory:
    ```bash
mkdir -p ~/.config/ntfy
cp /usr/share/examples/ntfy-notify-send-bridge-git/client.yml.example ~/.config/ntfy/client.yml
    ```
3.  Edit `~/.config/ntfy/client.yml` to add your ntfy subscriptions. Here's an example:

    ```yaml
    # ~/.config/ntfy/client.yml
    default-host: https://ntfy.sh
    subscribe:
      - topic: mypersonaltopic
        command: notify-send "$NTFY_TITLE" "$NTFY_MESSAGE"
        # Optional: Filter by priority
        # if: {priority: high,urgent}
      - topic: another_topic
        user: myuser
        password: mypassword
        command: notify-send -u critical "New message from $NTFY_TOPIC" "$NTFY_MESSAGE"
    ```

## Usage

After installation and configuration, enable and start the systemd user service:

```bash
systemctl --user enable ntfy-notify-send-bridge.service
systemctl --user start ntfy-notify-send-bridge.service
```

To check the service status or view logs:

```bash
systemctl --user status ntfy-notify-send-bridge.service
journalctl --user -u ntfy-notify-send-bridge.service -f
```

To stop the service:

```bash
systemctl --user stop ntfy-notify-send-bridge.service
```

## Dependencies

*   `python`
*   `python-requests`
*   `python-pyyaml`
*   `python-aiohttp`
*   `libnotify` (provides `notify-send`)

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
