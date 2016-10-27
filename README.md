# Dominions 4 Headless Server

## Installing

Install this package (`dom4-server`) using your AUR package manager of choice, or `makepkg`.

### Application

```bash
dom4 install
```

You will need to enter your Steam user ID, password, and Dominions 4 license key when prompted. SteamCMD may ask you to authenticate through Steam Guard.

### Network

Choose a port number between 1024 and 65535 and make sure you don't have anything else running on that port. Specify this number when configuring games.

If your computer is behind a router you will need to make sure the port is forwarded. It is also helpful to configure a static IP address so the routing stays consistent. Consult your router documentation for instructions.

## Usage

Most of the game configuration is accomplished through the `dom4` program. Run it without arguments for detailed usage instructions.

The actual game server is set up as a systemd service and can be managed via systemctl like any other service.

### Configuration

```bash
dom4 config mygame
```

Edit the file as desired and save. The `mapfile` should reference a file either in the current directory or in *your* `~/dominions4/maps` directory. Once you have a game configured:

1. `sudo systemctl start dom4-server` starts the server in pretender upload mode.
1. If `uploadmaxp` or `uploadtime` are set in your configuration, you're done: the game will start automatically when the appropriate limit is reached.
1. Once everyone has uploaded their pretenders, `dom4 ready` sets the game start flag. You can `dom4 ready mygame` to specify a game to host regardless of what was last configured.
1. Restart the server using `sudo systemctl restart dom4-server` to begin the game.

You may also want to `sudo systemctl enable dom4-server` in order to start the server automatically after reboots.

Note that only one game may be served at a time. If you configure or ready a new game, you will be asked if you want to host it instead of the current game. Any existing configuration will be preserved.

### Deleting Games

`dom4 delete mygame` removes the properties file and save directory. Maps are not removed.
