# Contributor: rabyte <rabyte*gmail>

pkgname=freenukum
pkgver=0.2.10
pkgrel=4
pkgdesc='A free port of the classic 2D Jump & Run game "Duke Nukum"'
arch=('i686' 'x86_64')
url="https://launchpad.net/freenukum/"
license=('GPL3')
depends=('sdl_ttf' 'curl' 'libzip')
makedepends=('pkgconfig>=0.9')
optdepends=('dosbox (extract shareware data)')
source=(http://launchpad.net/$pkgname/trunk/0.2/+download/$pkgname-$pkgver.tar.gz)
md5sums=('21c6d87944518ba88060988bbf78113e')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
