## Intro
A library (IME) which enables one to type in a variety of scripts. This is a fork of m17n-db modified with files from m17n-db (see url) for convenience of Indian (esp. sanskrit, kannada) users. This fork was created because we found contributing m17n-db delay-prone and unreliable. To contribute to our fork, please send pull requests to <https://github.com/indic-transliteration/m17n-db-indic> .

## Tech info
- AUR package location: <https://aur.archlinux.org/packages/m17n-db-indic/>
- Package source code locations:
    - git clone git@github.com:indic-transliteration/m17n-db-indic-aur.git
    - git clone ssh://aur@aur.archlinux.org/m17n-db-indic.git

## Creating a new Arch Linux package release
- Update PKGBUILD.
  - Fix the version numbers.
- Verify package by deleting tar archives from this directory and then running `makepkg -si`.
- Update AUR repository.
  - Set remote: `git remote add origin ssh://aur@aur.archlinux.org/m17n-db-indic.git`
  - Generate or update .SRCINFO with `makepkg --printsrcinfo > .SRCINFO`
  - Push to the AUR repo. (Even a single invalid commit will cause rejection.)
