# nordconnect
A simple shell script to connect to a NordVPN server through OpenVPN.

## Installation
nordconnect is composed by a single script file, just add it to your path.

### Arch Linux
If you are on Arch Linux, you can install the [nordconnect AUR package](https://aur.archlinux.org/packages/nordconnect/).

## Usage
```
nordconnect [--init | --update | server]
```

For a detailed list of options, run `nordconnect --help`.

### First use
Run `nordconnect --init` to initialize nordconnect. It will ask for your username and password.

### Update
Run `nordconnect --update` to download latest server definitions from NordVPN.

### Examples
```
# Just connect to a server
$ nordconnect us123

# Using nordselect to pick a server
$ nordconnect $(nordselect us)
```

## License
This project is licensed under the [GNU General Public License version 3](https://opensource.org/licenses/GPL-3.0)
