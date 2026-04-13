# Maintainer: Thomas Weißschuh <aur t-8ch de>

pkgname=equivs
pkgver=2.3.2
pkgrel=1
pkgdesc='Circumvent Debian package dependencies'
arch=('any')
url='https://salsa.debian.org/perl-team/modules/packages/equivs'
license=('GPL-2.0-only')
depends=(perl bash)
makedepends=(git)
source=(git+${url}.git/#tag=debian/$pkgver)
sha512sums=('91dad2c87d19c1b34f75a1f6b13b9f05b31f2b02a3feef11ce6f13a0e089cfd2e1d2e1c930b626bdfe92468719df18f5b528acc6e32cdda4d9904c1a8a1297ff')

build() {
	cd "$pkgname"

	make
}

package() {
	cd "$pkgname"

	cp -r usr/ "$pkgdir"
}
