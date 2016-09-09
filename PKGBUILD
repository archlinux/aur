# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/whitelight999/cylon
pkgname=cylon
pkgver=1.4
pkgrel=2
epoch=
pkgdesc="Maintenance , backup and system checks in a menu driven  Bash script"
arch=('any')
url="https://github.com/whitelight999/cylon"
license=('GPL')
source=("git://github.com/whitelight999/${pkgname%-git}.git")
md5sums=('SKIP')

package() {
	cd "$srcdir/${pkgname%-git}"
    install -D -m755 Cylon.sh "$pkgdir"/usr/bin/"${pkgname%-git}" 
}
md5sums=('SKIP')
