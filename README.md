# lopriv
A simple bash command to allow tools that use priviledged ports to run as non-root users.

## Usage
```bash
lopriv <command>
```

## Installation
### From file
#### Debian/Ubuntu based systems
```bash
sudo apt install ./lopriv.deb
```

#### RedHat/CentOS based systems
```bash
sudo yum install ./lopriv.rpm
```

#### Arch based systems
```bash
git clone https://aur.archlinux.org/lopriv.git
cd lopriv
makepkg -si
```

### From source
```bash
sudo curl -o /usr/local/bin/lopriv https://s.mcds.moe/lopriv.sh
sudo chmod +x /usr/local/bin/lopriv
```

### From AUR
```bash
yay -S lopriv

# or

paru -S lopriv
```

### From APT / Nala
```bash
echo "deb https://apt.mcds.moe/ /" | sudo tee /etc/apt/sources.list.d/mcds.list
sudo apt update
sudo apt install lopriv

# or with faster downloads

echo "deb https://apt.mcds.moe/ /" | sudo tee /etc/apt/sources.list.d/mcds.list
sudo nala update
sudo nala install lopriv
```

### With pacman
```bash
echo "[mcds]" | sudo tee -a /etc/pacman.conf
echo "Server = https://arch.repo.mcds.moe/\$repo" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu lopriv
```