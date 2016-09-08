# Maintainer: gavin lyons <whitelight999@live.ie>
# https://github.com/whitelight999/cylon
pkgname=cylon
pkgver=1.3
pkgrel=1
epoch=
pkgdesc="Maintenance, backups and system checks in a menu driven  Bash script"
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
