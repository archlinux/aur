# netskope-client-bin

Arch Linux PKGBUILD that repackages the Netskope Client (NSClient) `.deb`
into a native `pacman` package.

The Netskope binary is proprietary and not publicly redistributable, so
**this repo ships only the PKGBUILD - you provide the `.deb`** from your
own Netskope tenant.

## Build

1. Log into your Netskope tenant admin console.
2. Go to **Settings -> Tools -> Downloads -> Linux** and download
   `STAgent_amd64.deb` (the `.deb` variant - not the `.run` or `.rpm`).
3. Place the file next to this `PKGBUILD`.
4. Build and install:

   ```sh
   makepkg -si
   ```

The build patches the `stAgentUI` binary to use `webkit2gtk-4.1` and
`libayatana-appindicator` instead of the Arch-unavailable WebKit 4.0
and `libappindicator3` sonames. The daemon (`stAgentSvc`) and the CLI
tools are not modified.

## Enroll

```sh
sudo systemctl enable --now stagentd.service
sudo /opt/netskope/stagent/stAgentCli enroll <token> <tenant>
```

Optional per-user tray UI:

```sh
systemctl --user enable --now stagentapp.service
```

## Update

When Netskope ships a new client version:

1. Bump `pkgver` in the `PKGBUILD`.
2. Drop the new `STAgent_amd64.deb` into this directory.
3. `makepkg -si`.

## Versions

- Tested with: `135.1.4.2595`
- Arch: `x86_64` only

## License

The PKGBUILD itself is freely usable. The packaged binary remains
subject to the Netskope EULA; do not redistribute the resulting
`.pkg.tar.zst` outside the organization that holds the Netskope
license.
