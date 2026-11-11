# kotsasmin-toolkit-git (AUR)

AUR packaging for [Kotsasmin/toolkit](https://github.com/Kotsasmin/toolkit).

All code lives in the GitHub repository. This repo only holds the `PKGBUILD` (and its
`.SRCINFO`), which installs the GitHub files to `/usr/lib/toolkit` and adds the
`toolkit` and `kotsasmin-toolkit` commands. Never add scripts here; change them on GitHub.

## Publishing a new version

1. Push your changes to GitHub.
2. Update the package:

```bash
cd ~/development/kotsasmin-toolkit-git
makepkg -od                           # fetches GitHub and updates pkgver in PKGBUILD
makepkg --printsrcinfo > .SRCINFO
makepkg -fsi                          # optional: build and install it locally to test
git commit -am "Update to $(grep -Po '^pkgver=\K.*' PKGBUILD)"
git push origin master
```
