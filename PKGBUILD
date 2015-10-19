# Maintainer: Federico Damián Schonborn <feskyde>
#
# PKGBUILD for GitUp

pkgname="gitup"
pkgver=0.3
pkgrel=1
pkgdesc="The shell script that makes 'git' easier."
arch=('any')
url="https://github.com/feskyde/gitup"
license=('BSD')
depends=('git')
source=("https://github.com/feskyde/gitup/archive/v0.3-1.tar.gz")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-master/"
	install -dm 755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}