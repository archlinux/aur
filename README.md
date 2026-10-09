# khal-agenda-bin

AUR packaging for the prebuilt [Khal Agenda](https://github.com/mikkelrask/khal-agenda)
release. GTK4, Python, and khal are required; vdirsyncer is optional. A Wayland
compositor supporting layer-shell is required for the popup behavior.

Build with `makepkg --cleanbuild --noconfirm`. Install with `makepkg -i`.

After each upstream version tag, wait for the GitHub release build to succeed,
then update pkgver, reset pkgrel to 1, and pin the published archive's SHA256.
Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`, test the package,
and commit before pushing to AUR.
