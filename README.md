# Reflector Timer

Update pacman mirrorlist regularly using [reflector](https://wiki.archlinux.org/index.php/Reflector).

## Installation

```
yaourt -S reflector-timer-weekly
```

## Configuration

The configuration file is `/etc/reflector.conf`.

Contents in this file should be options of `reflector` (lines begin with '#' are comments). This way you have the whole control about how `reflector` will be run.

For example:

```
--country China
--country 'United States'
--sort rate
--save /etc/pacman.d/mirrorlist
```

Run `reflector --help` to see available options.

## Usage

```
# enable timer
sudo systemctl enable reflector.timer

# disable timer
sudo systemctl disable reflector.timer

# update mirrorlist immediately
sudo systemctl start reflector.service
```

## LICENSE

MIT
