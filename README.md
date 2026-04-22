# aurivo-bin (AUR)

This folder contains a ready-to-publish `PKGBUILD` for AUR.

## Publish flow

1. Create or clone your AUR repo:
   - `ssh://aur@aur.archlinux.org/aurivo-bin.git`
2. Copy `PKGBUILD` from this folder into that repo.
3. Update `pkgver` to your release version (`X.Y.Z`).
4. Generate checksums:
   - `updpkgsums`
5. Generate `.SRCINFO`:
   - `makepkg --printsrcinfo > .SRCINFO`
6. Commit and push to AUR:
   - `git add PKGBUILD .SRCINFO`
   - `git commit -m "aurivo-bin: update to vX.Y.Z"`
   - `git push`

## User install

- With AUR helper: `yay -S aurivo-bin`
- Manual:
  - `git clone https://aur.archlinux.org/aurivo-bin.git`
  - `cd aurivo-bin && makepkg -si`
