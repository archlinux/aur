## Intro
Installs stardict dictionaries from the https://github.com/indic-dict/ project. Languages covered: Sanskrit, Pali, Malayalam, Kannada, Tamil, Telugu, Bengali, Oriya, Hindi, Nepali, Gujarati, Marathi, Panjabi/ Punjabi, Sinhala, Assamese, English, Latin...

## Technical info
- AUR package location: <https://aur.archlinux.org/packages/stardict-indic-update/>
- Package source code locations:
    - git clone git@github.com:sanskrit-coders/stardict-indic-update-aur.git
    - git clone ssh://aur@aur.archlinux.org/stardict-indic-update.git

## Creating a new Arch Linux package release
- Create a github release at <https://github.com/indic-dict/dict-tools/releases>.
- Update PKGBUILD.
  - Fix the version numbers.
  - Get the sha256sum by:
    - Downloading the github release package.
    - running something like `sha256sum sanskrit-fonts-1.0.tar.gz`
- Verify package by running `makepkg -si`.
- Update AUR repository.
  - Set remote: `git remote add ssh://aur@aur.archlinux.org/stardict-indic-update.git .`
  - Generate or update .SRCINFO with `makepkg --printsrcinfo > .SRCINFO`
  - Push to the AUR repo. (Even a single invalid commit will cause rejection.)

## References
- https://wiki.archlinux.org/index.php/creating_packages

