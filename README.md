# GitHub Copilot Arch Linux Package

Local Arch Linux packaging for the official GitHub Copilot Debian build.

## Build

```bash
makepkg --verifysource
makepkg -Ccf
namcap PKGBUILD
namcap github-copilot-bin-*.pkg.tar.zst
```

## Install

```bash
sudo pacman -U ./github-copilot-bin-*.pkg.tar.zst
```

The upstream package installs these public commands:

- `/usr/bin/github`
- `/usr/bin/git-credential-copilot`

## Update

For a new upstream release:

1. Change `pkgver` in `PKGBUILD`.
2. Reset `pkgrel=1`.
3. Run `updpkgsums`.
4. Regenerate metadata:

   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

5. Rebuild and run the checks above.

If only the Arch packaging changes, keep `pkgver` unchanged and increment
`pkgrel`.
