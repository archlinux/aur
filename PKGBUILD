# Maintainer: Ryan Chou <rjchou@icloud.com>
pkgname=hyprsession-sh
pkgver=1.2
pkgrel=1
pkgdesc="Simple, functional session manager"
arch=('any')
license=('aGPL3')
source=("hyprsession.sh")
sha256sums=('SKIP')

package() {
	install -Dm755 "$srcdir/../hyprsession.sh" "$pkgdir/usr/bin/hyprsession.sh"
}
