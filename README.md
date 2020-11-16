# rankmirrors-systemd

This AUR package provides Systemd unit and timer for ranking Pacman mirrors based on the host network. Other ranking systems, like [reflector](xyne.archlinux.ca/projects/reflector/), usually rank mirrors server-side, filtering them by country. Though this usually represents an improvement on not ranking mirrors at all, in many cases mirrors from the same country as the host are not the fastest. For instance, for a host located in Northern Italy, many hosts from Switzerland and some from the USA are usuall much faster than mirrors located in Italy.

## Install

The package is on [AUR](https://aur.archlinux.org/packages/rankmirrors-systemd) so use your favorite tool for installing it.

```shell
yay -S rankmirrors-systemd
```

Then remember to enable the Systemd timer to rank mirrors automatically every day at midnight.

```
sudo systemctl enable --now rankmirrors.timer
```
