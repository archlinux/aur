# New ddev release:

* Bump `pkgver` key in `PKGBUILD`
* Update the `sha256sums` key appropriately
* Do _not_ bump `pkgrel` key
* `makepkg --printsrcinfo > .SRCINFO`
* Test that the package builds properly: `makepkg -s`
* If everything is good, `git add .SRCINFO PKGBUILD && git commit -m "Bumping ddev-bin version"`
* `git push`
