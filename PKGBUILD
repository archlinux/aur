# Maintainer: alienzj <lovelornpig@gmail.com>

pkgname=bioawk
pkgver=1.0
pkgrel=1
pkgdesc="BWK awk modified for biological data"
arch=('i686' 'x86_64')
url="https://github.com/lh3/bioawk"
license=('GPL')
provides=("bioawk")
conflicts=("bioawk" "bioawk-git")
source=("https://github.com/lh3/bioawk/archive/v1.0.tar.gz")
md5sums=('a2d0dbb2943b3e0bea96a5360390b656')

prepare() {
  cd "$srcdir/$pkgname-${pkgver}"
}

build() {
  cd "$srcdir/$pkgname-${pkgver}"
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"
  install -Dm755 bioawk "$pkgdir/usr/bin/bioawk"
}
