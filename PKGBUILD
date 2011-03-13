# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=gnuclad
pkgver=0.2.3
pkgrel=1
pkgdesc="A cladogram tree generator mainly used by GNU/Linux distro timeline project"
arch=('i686' 'x86_64')
license=('GPL')
url="https://launchpad.net/gnuclad"
depends=()
source=(http://launchpad.net/gnuclad/trunk/0.2/+download/$pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
md5sums=('9dd89264a44fd37c45e58a9133475fc2')
