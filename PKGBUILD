# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Andreas B. Wagner <AndreasBWagner@gmail.com>

pkgname=cook
pkgver=2.34
pkgrel=2
pkgdesc="A powerful make alternative"
arch=('i686' 'x86_64')
url=http://miller.emu.id.au/pmiller/software/cook/
license=('GPL3')
depends=('perl')
source=("http://miller.emu.id.au/pmiller/software/cook/$pkgname-$pkgver.tar.gz")
source=("http://fossies.org/linux/misc/old/$pkgname-$pkgver.tar.gz")
md5sums=('9ec89c0f983213696fa0dd59c05e66ba')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

