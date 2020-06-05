# Maintainer: Ben Westover <kwestover.kw@gmail.com>
pkgname=tempconvert
pkgver=1.0
pkgrel=1
pkgdesc="Utility for converting temperatures between Fahrenheit and Celsius."
arch=('any')
url="https://benthetechguy.github.io/miscprograms/tempconvert"
license=('GPL')
depends=('bash' 'bc')
source=("$pkgname")
noextract=('$pkgname')
md5sums=('bc379290abc64f5fc2fd08c29dc1ef7f')

package() {
	mkdir -p ${pkgdir}/usr
	mkdir -p ${pkgdir}/usr/bin
	cp $pkgname ${pkgdir}/usr/bin
}
