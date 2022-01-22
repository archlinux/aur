# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=musket
pkgver=1.1
pkgrel=2
pkgdesc="a parallel short-read error corrector for Illumina sequencing "
arch=('i686' 'x86_64')
url="https://musket.sourceforge.net"
license=('GPL3')
depends=('gcc-libs' 'zlib')
source=("https://downloads.sourceforge.net/musket/$pkgname-$pkgver.tar.gz")
md5sums=('28455d698304d1387e5ee274506a7ed9')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 musket $pkgdir/usr/bin/musket
}
