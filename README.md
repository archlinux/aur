# sshtool

**sshtool** is a simple interactive SSH session manager with encrypted configuration storage using GPG.  
It allows you to store multiple SSH configurations (including Mosh and Tmate), securely encrypt them, and connect easily with interactive fuzzy selection via [fzf](https://github.com/junegunn/fzf).

---

## Features

- GPG-encrypted configuration file
- Save SSH credentials, port forwards, and additional args
- Support for SSH, Mosh, and Tmate
- Interactive config selector with `fzf`
- Add/edit/remove configs easily
- Portable single-file script

---

## Requirements

- Python 3.7+
- GPG (`gpg`)
- [fzf](https://github.com/junegunn/fzf)
- Optional: `sshpass`, `mosh`, `tmate`

---

## Installation

### AUR

```bash
yay -S sshtool
```

### Manualy

```bash
git clone https://github.com/hanashiko/sshtool.git
cd sshtool
chmod +x install.sh
sudo ./install.sh
```

---

## Usage

### Add a new SSH config

```bash
sshtool --add
```

### Connect to a config (interactive)

```bash
sshtool --choose
```

### List configs

```bash
sshtool --list
```

### Connect to a spicific ocnfig

```bash
sshtool <config_name>
```

---

## GPG

Make sure you have a GPG key:

```bash
gpg --list-secret-keys
```

You can predefine the recipient using an environment variable:

```bash
export SSHTOOL_GPG_RECIPIENT=your@email.com
```

---

## Configuration location

By default: `~/.config/sshtool/sshtool.gpg`

---

## License

MIT License

--- 

## Author

Hanashiko