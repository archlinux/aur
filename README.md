# shottino-bin

Official prebuilt Shottino releases for Arch Linux x86_64, repackaged from
[vjt/grappa-irc](https://github.com/vjt/grappa-irc/releases).

Shottino is an ncurses terminal client for Grappa's REST and Phoenix Channels
API. It can also provide a local IRC bridge for other IRC clients using `--ircd`.
It connects to a Grappa server; it does not connect directly to arbitrary IRC
networks. A local Grappa installation is optional.

## Install and use

Install with `yay -S shottino-bin`, or clone this AUR repository and run
`makepkg -si` after reviewing the PKGBUILD.

```sh
shottino --help
shottino --version
shottino https://grappa.chat YOUR_USERNAME
```

Use the URL and account for your Grappa instance. Follow the interactive
authentication prompt rather than putting a password in shell history.

Optional dependencies:

- `ffmpeg`: inline image, video and GIF previews.
- `chafa`: enhanced terminal image rendering.
- `xdg-utils`: open links in external applications.
- `grappa-bin`: self-host a Grappa server on this machine.

For the IRC bridge and other features, see the
[upstream client documentation](https://github.com/vjt/grappa-irc/tree/main/frontends/shottino).

## Versions and packaging

Shottino has an independent version number. For example, Grappa release
`v1.5.14` contains Shottino `0.3.1`. A newer Grappa release can carry a rebuilt
Shottino with the same version; in that case this package's `pkgrel` increases.
Each download uses a pinned release URL and SHA-256 checksum.

This is a community-maintained binary package. It provides and conflicts with
`shottino` and installs no server service. Report packaging problems on this AUR
page and application bugs at [upstream issues](https://github.com/vjt/grappa-irc/issues).
