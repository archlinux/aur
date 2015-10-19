# Maintainer: Federico Damián Schonborn <feskyde>
#
# PKGBUILD for Meryllete

pkgname="meryllete"
pkgver=0.1
pkgrel=2
pkgdesc="Your AUR4 uploads made easy."
arch=('any')
url="https://github.com/feskyde/meryllete"
license=('BSD')
depends=('pkgbuild-instropection')
source=("https://github.com/feskyde/meryllete/archive/v0.1-2.tar.gz")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-master/"
	install -dm 755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}