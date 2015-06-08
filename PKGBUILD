# Author: Samu Juvonen <samu.juvonen@gmail.com>

pkgname=coquillo
pkgver=1.12
pkgrel=36
pkgdesc='Edit metadata / tags of various audio formats like MP3, Ogg/Vorbis and FLAC.'
arch=('i686' 'x86_64')
url='http://qt-apps.org/content/show.php/Coquillo?content=141896'
license='GPL'
depends=('qt4' 'taglib')
source=(http://cs.uef.fi/~sjuvonen/coquillo/$pkgver/coquillo-$pkgver-src.tar.gz)
md5sums=('f53c29854b01a7b3bc2c757916bb66cb')

build() {
	cd $startdir/src/coquillo-$pkgver/
	qmake-qt4
	make
	make install INSTALL_ROOT=${pkgdir}
}

