# Contributor: Daniel Milde <daniel at milde dot cz>
# Contributor: Toni Foerster <stonerl at skeps dot de>
# Contributor: André Klitzing <aklitzing at online dot de>
# Maintainer: Matrix <thysupremematrix at tuta dot io>

pkgname=intltool-debian
pkgver=0.35.0+20060710.6
pkgrel=1
epoch=1
pkgdesc="The internationalization tool collection with RFC822 support"
arch=('any')
url="http://www.debian.org/"
license=('GPL')
depends=('gettext' 'perl')
source=(https://deb.debian.org/debian/pool/main/i/intltool-debian/${pkgname}_${pkgver}_all.deb)
sha256sums=('058900c66cbc0d8b60139bdecc9a06cb9c3b479a03117354a78e5fa72aecd90c')

package() {
	tar xpf $srcdir/data.tar.xz -C $pkgdir
}

