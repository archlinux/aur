# Maintainer: Craig Tatlor <ctatlor92@outlook.com>
pkgname=unandmanager
pkgver=2.1.3
pkgrel=1
pkgdesc="A tool to backup a rednand install"
arch=('i686' 'x86_64')
url="https://github.com/opendata26/unandmanager"
license=('GPL')
source=('https://github.com/opendata26/unandmanager/archive/'$pkgver'.tar.gz')
md5sums=('57a7c0f22a05f8f322968acd3c0da5a3')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make install DESTDIR=$pkgdir
}
