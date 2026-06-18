# af-pro-display-bin

AUR package for [af-pro-display](https://github.com/KylerianHD/antec-flux-pro-display), a systemd service that shows real-time CPU and GPU temperatures on the [Antec Flux Pro](https://www.antec.com/product/case/flux-pro) case display under Linux.

## Installation

**Using an AUR helper:**
```bash
yay -S af-pro-display-bin
# or
paru -S af-pro-display-bin
```

**Manually:**
```bash
git clone https://aur.archlinux.org/af-pro-display-bin.git
cd af-pro-display-bin
makepkg -si
```

Then enable the service:
```bash
sudo systemctl enable --now af-pro-display
```

## Configuration

The service reads `/root/.config/af-pro-display/config.toml`. Example:

```toml
cpu_device = "/sys/class/hwmon/hwmon0/temp1_input"
polling_interval = 200
```

## Service management

```bash
sudo systemctl status af-pro-display
sudo systemctl stop af-pro-display
sudo systemctl start af-pro-display
sudo systemctl disable af-pro-display
sudo systemctl enable af-pro-display
```

## Credits

- [KylerianHD/antec-flux-pro-display](https://github.com/KylerianHD/antec-flux-pro-display) - upstream project

## License

The packaging files in this repository are licensed under [GPL-3.0](LICENSE).
The packaged software itself is licensed under [GPL-3.0](https://github.com/KylerianHD/antec-flux-pro-display/blob/main/LICENSE).
