# pmcli - (p)lay (m)usic for (cli)

Browse and stream Google Play Music from the command line

![screencast]( https://zippy.gfycat.com/SnivelingLavishAtlanticblackgoby.gif "gfy")

## Dependencies

- [Python 3](https://python.org/downloads/)
- [mpv](https://mpv.io)
- [gmusicapi](https://github.com/simon-weber/gmusicapi): `pip install gmusicapi`

## Installation

```sh
git clone https://github.com/christopher-dG/pmcli
cd pmcli
```

Now, edit the `[auth]` section of `config` with your Google account information. Next:

```sh
mkdir -p ~/.{config/pmcli,local/share/pmcli/{src,script,playlists}}
cp config mpv_input.conf ~/.config/pmcli
cp {pmcli,music_objects,util}.py ~/.local/share/pmcli/src
cp get_dev_id.py ~/.local/share/pmcli/script
chmod +x ~/.local/share/pmcli/src/pmcli.py
ln -s ~/.local/share/pmcli/src/pmcli.py /usr/local/bin/pmcli
```

## Device ID

If you don't know your device ID, run `python get_dev_id.py` and answer the prompts to generate a list of valid device IDs.

## Running pmcli

Once installed, the program can be run with `pmcli`.

Note: Please, for your own sake, don't resize your terminal while the program is running.

## Controls

- `s/search search-term`: Search for 'search-term'
- `e/expand 123`: Expand item number 123
- `p/play`: Play current queue
- `p/play s`: Shuffle and play current queue
- `p/play 123`: Play item number 123
- `q/queue`: Show current queue
- `q/queue 123`:  Add item number 123 to queue
- `q/queue 1 2 3`:  Add items 1, 2, 3 to queue
- `q/queue c`:  Clear current queue
- `w/write file-name`: Write current queue to file file-name
- `r/restore file-name`: Replace current queue with playlist from file-name
- `h/help`: Show help message
- `Ctrl-C`: Exit pmcli

When playing music:

- `spc`: Play/pause
- `9/0`: Volume down/up (Note: volume changes do not persist across songs, so I recommend you adjust your system volume instead)
- `n`: Next track
- `q`: Stop

## Colours

Colour themes are defined in the `[colour]` section of your config file. To enable colour, make sure `enable` is set to `yes` and set the fields to hex colours as desired. `highlight` affects the section headers and 'now playing' output, `content{1|2}` affect the main window, and `background` and `foreground` are self-explanatory.

Note: Upon exiting the program, your terminal colours will likely be modified. Just open a new terminal session and your colours will be back to normal.

## Crashes

If `pmcli` crashes, your terminal settings will likely be messed up, in which case enter `stty sane` to restore order. And don't forget to file an issue!

## 2-Factor Authentication

If your account has 2FA set up, you will need to use an [app password](https://support.google.com/accounts/answer/185833?hl=en) to log in. Replace the `password` field in your config file with the app password.

### Disclaimer
Expect bugs, and please report them! I hope you enjoy using pmcli, and if you don't, that's okay too because I enjoy working on it.
