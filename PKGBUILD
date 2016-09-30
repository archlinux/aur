# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/cylon
pkgname=cylon
pkgver=2.0
pkgrel=8
epoch=
pkgdesc="Maintenance , backup and system checks in a menu driven  Bash script"
arch=('any')
url="https://github.com/gavinlyonsrepo/cylon"
license=('GPL')
source=("git://github.com/gavinlyonsrepo/${pkgname%-git}.git")
md5sums=('SKIP')

package() {
	cd "$srcdir/${pkgname%-git}"
    install -D -m755 Cylon.sh "$pkgdir"/usr/bin/"${pkgname%-git}" 
    mkdir -p "$HOME/.config/cylon/"
    install -D -m644 Readme.md "$HOME"/.config/cylon/cylonReadme.md
}
md5sums=('SKIP')
