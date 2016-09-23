# Dominions 4 Headless Server

## Installing

Install this package (`dom4-server`) using your AUR package manager of choice, or `makepkg`.

Dominions 4 must be installed to /opt/Dominions4. If you already have it installed elsewhere and don't want to mess around with permissions, it's easiest to just copy it.

If you installed it from the Steam GUI:

```bash
sudo cp -R ~/.local/share/Steam/steamapps/common/Dominions4 /opt
```

If you installed it via SteamCMD (see below for directions if you're starting from scratch with no GUI):

```bash
sudo cp -R ~/Steam/steamapps/common/Dominions4 /opt
```

If you can't find it at either of those locations, try `locate dom4.sh` (if you *just* installed Dominions 4, `sudo updatedb` first). This should output one line with the full path and filename of `dom4.sh`. `sudo cp -R` the path, excluding the filename.

### License Key

Your install directory must have a `dom4key` file present containing your Dominions 4 license key. If the file does not already exist, you can create it using the license information from Steam.

### Network

You can use whatever port number you like between 1024 and 65535. Make sure you don't have anything else running on that port.

If your computer is behind a router you will need to make sure the port is forwarded. It is also helpful to configure a static IP address so the routing stays consistent. Consult your router documentation for instructions.

## Game Configuration

Your game configuration is stored in key=value format in a properties file. Copy `default.properties` to a safe location and edit as needed. `mapfile` should reference the filename of a map in *your* `~/dominions4/maps` directory. Once ready:

1. `dom4 config mygame.properties` loads your config into the server and sets the current game name.
1. `systemctl start dom4-server` starts the server in pretender upload mode.
1. If `uploadmaxp` or `uploadtime` are set in your configuration, you're done: the game will start automatically when the appropriate limit is reached. If not, wait for everyone to upload their pretenders and then bring the server down with `systemctl stop dom4-server`.
1. `dom4 ready` sets the game's start flag.
1. Restart the server using `systemctl start dom4-server` again to begin the game.

You may also want to `systemctl enable dom4-server` in order to start the server automatically after reboots.

Note that only one game may be served at a time. If you run `dom4 config` with a config file when a game has already been set up, it will ask if you want to overwrite the existing game. 

## SteamCMD

Here's how to download and install Dominions 4 from Steam without needing to let X or a monitor anywhere near your computer:

1. Install `steamcmd` using your AUR package manager of choice.
1. Run `steamcmd`.
1. `login your_user_name`. Supply the password if asked.
1. `app_update 259060`. Once the download finishes, you're all set.
