# Contributor: Daniel Milde <daniel at milde dot cz>
# Contributor: Toni Foerster <stonerl at skeps dot de>
# Contributor: André Klitzing <aklitzing at online dot de>

pkgname=intltool-debian
pkgver=0.35.0
pkgrel=7
pkgdesc="The internationalization tool collection with RFC822 support"
arch=('any')
url="http://www.debian.org/"
license=('GPL')
depends=('gettext' 'perl')
source=(https://deb.debian.org/debian/pool/main/i/intltool-debian/${pkgname}_${pkgver}+20060710.5_all.deb)
sha256sums=('1ab5215e135b2b55178083ef6115913e49c6d661e7fb4f0086c1d740dc69aa5d')

build() {
	cd ${srcdir}
	tar -xJf data.tar.xz
}

package() {
	cd ${srcdir}
	cp -r usr ${pkgdir}
}
