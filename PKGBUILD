# Maintainer: Samu Juvonen <samu.juvonen@gmail.com>

pkgname=coquillo
pkgver=2.0.0
pkgrel=1
pkgdesc='Utility for editing metadata i.e. "tags" contained in audio files.'
arch=('i686' 'x86_64')
url='http://qt-apps.org/content/show.php/Coquillo?content=141896'
license=('GPL')
depends=('qt5-multimedia' 'qt5-translations' 'taglib')
makedepends=('qt5-tools')
source=(http://cs.uef.fi/~sjuvonen/coquillo/$pkgver/coquillo-$pkgver-src.tar.gz)
md5sums=('7e6ed965b23b71c8d69087b6d9d698ed')

package() {
	cd "${srcdir}/coquillo-${pkgver}/"
	qmake
	make
	make install INSTALL_ROOT="${pkgdir}"
}

