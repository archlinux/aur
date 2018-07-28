# Maintainer: Samu Juvonen <samu.juvonen@gmail.com>

pkgname=coquillo
pkgver=2.0.1
pkgrel=2
pkgdesc='Utility for editing metadata i.e. "tags" contained in audio files.'
arch=('i686' 'x86_64')
url='https://www.opendesktop.org/p/1130981/'
license=('GPL')
depends=('qt5-multimedia' 'qt5-translations' 'taglib' 'libmusicbrainz5')
makedepends=('qt5-tools')
source=(http://cs.uef.fi/~sjuvonen/coquillo/$pkgver/coquillo-$pkgver-src.tar.gz)
md5sums=('824b73cf26a28adc18f8db55739bf380')

package() {
	cd "${srcdir}/coquillo-${pkgver}/"
	qmake
	make
	make install INSTALL_ROOT="${pkgdir}"
}
