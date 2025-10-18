# root_rain

An aestetic root_rain program written in Rust.

## Installation

### Automated Installation (Recommended)

1. Clone or download this repository
2. Run the installer:


```
git clone https://github.com/execrooted/root_rain.git
```
```
cd root_rain
```
```
sudo ./install.sh
```



The installer will automatically:
- Install Rust if not present
- Build the root_rain
- Install it system-wide to `/usr/local/bin/root_rain`



### Arch Linux 

If you have the PKGBUILD file, install using makepkg:

```bash
yay -S root_rain
# Or any AUR helper
```
This will build and install the package globally.

Then to run it:
```
root_rain
```



## Uninstallation

```bash
cd root_rain
```
```
sudo ./uninstall.sh
```
### Arch Linux 

```
yay -R root_rain
# Or any AUR helper
```

## Usage

Run the animation with default settings:

```bash
root_rain
```

### Command Line Options

- `-s, --speed <SPEED>`: Set animation speed (fast=1.5x, medium=1.0x, slow=0.5x)
- `-c, --color <COLOR>`: Set drop color (black, red, green, yellow, blue, magenta, cyan, white, grey)
- `-b, --bold`: Make drops bold
- `-w, --weather <WEATHER>`: Set weather type (rainy, snowy)
- `--direction <DIRECTION>`: Set horizontal drift (left, right, down)
- `--continuity`: Enable continuity mode (particles disappear instead of staying)
- `-l, --live [COLOR1] [COLOR2]`: Enable live effect (colors fade from color1 to color2 based on height, defaults to blue white if no colors specified)
- `--character <CHAR>`: Set all particles to a specific character

### Examples

Stowy weather with switching live colors:
```bash
root_rain --weather snowy -l
```

Snow with left drift:
```bash
root_rain --weather snowy --direction left
```

Fast animation with continuity:
```bash
root_rain --speed fast --continuity
```

## Controls

- Press Ctrl+C to exit the animation



## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

---

***Made by execRooted***
