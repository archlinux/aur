# Maintainer: Philippe Cavalaria <philippe.cavalaria at moc.liamg>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=ksuperkey
pkgver=0.4
pkgrel=2
pkgdesc="Allows you to open the application launcher in KDE Plasma Desktop using the Super key"
arch=(i686 x86_64)
url="https://github.com/hanschen/ksuperkey"
license=(GPL)
depends=(libxtst)
makedepends=()
source=("https://github.com/hanschen/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('2dd4539de4366e8aa185d5bf375e203b')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

