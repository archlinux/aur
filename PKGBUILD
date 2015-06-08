# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=liburlmatch
pkgver=1.0
pkgrel=1
pkgdesc="Fast URL matcher library"
url="https://github.com/clbr/urlmatch"
license=('AGPL3')
arch=('i686' 'x86_64')
makedepends=('git')
options=(libtool staticlibs)
source=($pkgname-$pkgver.tar.gz::https://github.com/clbr/urlmatch/archive/v$pkgver.tar.gz)
md5sums=('bd55cd2de5ba591f714e9282d002369e')

build() {
  cd urlmatch-$pkgver
  make
}

package() {
  cd urlmatch-$pkgver
  make DESTDIR=$pkgdir install
}
