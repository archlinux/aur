# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=('xconvers')
pkgver="0.8.3"
pkgrel=2
pkgdesc="Client for the Amateur Radio (HAM) convers system"
arch=('i686' 'x86_64')
#url="http://xconvers.sourceforge.net/"
url=https://web.archive.org/web/20070522031448/http://www.qsl.net/pg4i/linux/xconvers.html
license=('GPL2')
depends=('gtk')
source=("ftp://ftp5.gwdg.de/pub/linux/slackware/slackware-11.0/extra/source/ham/$pkgname/$pkgname-$pkgver.tar.bz2")

build() {
	cd "$srcdir/$pkgname-$pkgver/"
	./configure --prefix=/usr --datadir=/usr/share --mandir=/usr/share/man
	make
	}


package(){
	cd "$srcdir/$pkgname-$pkgver/"
	make DESTDIR="$pkgdir" install
	}
md5sums=('2e3d94033341f3268ef95163fa403fc4')
sha256sums=('ad07ffb920b66445c9e46e8025e1ca58a62b01122d748351019af10d78e78f3a')
