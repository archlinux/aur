# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=bitefusion
pkgver=1.0.1
pkgrel=2
pkgdesc="A snake game with 8 levels"
arch=('i686' 'x86_64')
url="http://www.junoplay.com"
license=('GPL')
depends=('sdl' 'zlib')
source=(http://www.junoplay.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('d7bc933c3363a76b4cb3eeb2a4f33b40')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
