# swaycut

A **minimal screenshot utility for Sway**

_Originally based on [sway-screenshot by Gustash](https://github.com/Gustash/sway-screenshot), with minimal changes._

## ⚙️ Dependencies

- `sway` - Don't be stupid
- `grim` – Wayland screenshot utility
- `slurp` – region/window selection
- `swaymsg` + `jq` – get window geometry
- `wl-copy` – copy to clipboard
- `imagemagick` (`magick`) – trim edges
- `libnotify` (via `notify-send`) – notifications

## 🚀 Installation

### From AUR:

```bash
yay -S swaycut
```

### Manual:

```bash
git clone https://github.com/shaaanuu/swaycut.git
cd swaycut
ln -s "$PWD/swaycut" ~/.local/bin/swaycut
chmod +x swaycut
```

## 🛠 Usage

```bash
swaycut -m <mode> [options] -- [command]
```

**Modes**:

- `output` - capture the currently focused monitor
- `window` - capture the currently focused window
- `region` - interactively select an area to capture

**Options**:

- `-o, --output-folder <dir>` - save path
- `-f, --filename <name>` - override filename
- `--clipboard-only` - no disk save
- `-s --silent` - no notification
- `-d --debug` - show debug logs

Example: screenshot a window and open it with `feh`:

```bash
swaycut -m window -- feh
```

## 🧩 Example Sway keybindings

```sway
bindsym Print exec swaycut -m output
bindsym $mod+Print exec swaycut -m window
bindsym $mod+Shift+Print exec swaycut -m region
```

## 🧾 License

Licensed under [MIT](LICENSE).
