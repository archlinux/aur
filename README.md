
AUR package location: <https://aur.archlinux.org/packages/sanskrit-fonts/>

# Creating a new Arch Linux package release
- Create a github release at <https://github.com/sanskrit-coders/sanskrit-fonts/releases>.
- Update PKGBUILD.
  - Fix the version numbers.
  - Get the sha256sum by:
    - Downloading the github release package.
    - running something like `sha256sum sanskrit-fonts-1.0.tar.gz`
- Verify package by running `makepkg`.
- Update AUR repository.
  - Clone or update the AUR repo working directory: aur
    - Example: `git clone ssh://aur@aur.archlinux.org/sanskrit-fonts.git`
  - Generate or update .SRCINFO with `makepkg --printsrcinfo > aur/.SRCINFO`
  - Push to the AUR repo.
