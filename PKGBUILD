# Maintainer: Federico Damián Schonborn <feskyde>
#
# PKGBUILD for GitUp

pkgname=gitup
pkgver=0.3
pkgrel=1
pkgdesc="The shell script that makes 'git' easier."
arch=('any')
url="https://github.com/feskyde/gitup"
license=('BSD')
depends=('git')
source=("https://github.com/feskyde/gitup/archive/v${pkgver}-${pkgrel}.zip")
md5sums=('SKIP')

package() {
	cd "$srcdir/gitup-${pkgver}-${pkgrel}"
	mkdir -p "$pkgdir/usr/bin/"
	cp gitup "$pkgdir/usr/bin/gitup"
}
