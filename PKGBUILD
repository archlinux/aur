# Maintainer: Federico Damián Schonborn <feskyde>
#
# PKGBUILD for Meryllete

pkgname=meryllete
pkgver=0.1
pkgrel=2
pkgdesc="Your AUR4 updates, easiest."
arch=('any')
url="https://github.com/feskyde/meryllete"
license=('BSD')
depends=('git' 'pkgbuild-introspection')
source=("https://github.com/feskyde/meryllete/archive/v${pkgver}-${pkgrel}.zip")
md5sums=('SKIP')

package() {
	cd "$srcdir/meryllete-${pkgver}-${pkgrel}"
	mkdir -p "$pkgdir/usr/bin/"
	cp meryllete "$pkgdir/usr/bin/meryllete"
}
