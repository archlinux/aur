# Maintainer: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgname=currentime
pkgver=1.0
pkgrel=1
pkgdesc="Utility written in bash that tells the time in many different formats"
arch=('any')
url="https://benthetechguy.github.io/miscprograms/currentime"
license=('GPL')
depends=('bash')
source=("$pkgname")
noextract=('$pkgname')
md5sums=('e8413faaf292707e4422c39541aab767')

package() {
	mkdir -p ${pkgdir}/usr
	mkdir -p ${pkgdir}/usr/bin
	cp $pkgname ${pkgdir}/usr/bin
}
