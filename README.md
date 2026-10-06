# AUR packaging

`PKGBUILD`, `pipewire-waybar.install` and `.SRCINFO` for the
[`pipewire-waybar`](https://aur.archlinux.org/packages/pipewire-waybar) AUR
package. The package builds from a tagged GitHub release tarball.

## Releasing a new version

1. Tag and push the release in the main repo:
   ```
   git tag 1.0.1 && git push origin 1.0.1
   ```
2. In this folder, bump `pkgver` (reset `pkgrel=1`), then refresh the checksum
   and metadata:
   ```
   updpkgsums
   makepkg --printsrcinfo > .SRCINFO
   ```
3. Test in a clean chroot (or at least `makepkg -si`) and lint:
   ```
   extra-x86_64-build        # from devtools; or: makepkg -si
   namcap PKGBUILD *.pkg.tar.zst
   ```
4. Copy `PKGBUILD`, `pipewire-waybar.install` and `.SRCINFO` into your AUR
   clone, commit and push:
   ```
   cp PKGBUILD pipewire-waybar.install .SRCINFO ~/aur/pipewire-waybar/
   cd ~/aur/pipewire-waybar
   git add PKGBUILD pipewire-waybar.install .SRCINFO
   git commit -m "Update to 1.0.1" && git push
   ```

## First-time AUR setup

1. Create an account at <https://aur.archlinux.org/register> and add your SSH
   public key under *My Account*.
2. Add to `~/.ssh/config`:
   ```
   Host aur.archlinux.org
     IdentityFile ~/.ssh/aur
     User aur
   ```
3. Clone the (empty) package repo. Cloning a name that doesn't exist yet is
   how a new AUR package is created:
   ```
   git clone ssh://aur@aur.archlinux.org/pipewire-waybar.git ~/aur/pipewire-waybar
   ```
4. Copy the files in, commit and push as in step 4 above. The package appears
   at <https://aur.archlinux.org/packages/pipewire-waybar>.
