# fetcher

Updates your git-repositories by running git commands, that you specify for
each of your repositories.

## Install

### Arch Linux

For Arch Linux simply use yaourt:
```sh
yaourt -S fetcher
```
Done!

### Other Distributions

Clone this repo and copy the `fetcher.sh` to a location which is in your
`$PATH` environment variable, e.g `~/.local/bin`:

```sh
cp ./fetcher.sh ~/.local/bin/fetcher
```

That's it, but if you want to use the systemd service you need to install the
unit file `fetcher.service` to a systemd unit path, e.g.
`~/.config/systemd/user`:

```sh
cp ./fetcher.service ~/.config/systemd/user/fetcher.service
```

## Configuration

In order to make this working, you need a configuration file, which is by
default at `~/.config/fetcher.conf`. Each line consists of the repository and
the action to be performed in that repository:
```
$HOME/workspace/repo pull --ff-only
~/workspace/repo2 pull origin master:master
~/workspace/repo2 push
```
## Usage

### Manually

In order to perform the actions, just run
```
fetcher
```

### Automatically with systemd

The installed systemd service file will run `fetcher` automatically, after the
network is online. To enable this just run following commands:
```
systemctl --user reload-daemon
systemctl --user enable fetcher.service
```
To try it out you can run:
```
systemctl --user start fetcher.service
systemctl --user status fetcher.service
```
