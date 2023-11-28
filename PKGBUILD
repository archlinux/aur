# Maintainer: Gabriel Guerra <gfranklings@gmail.com>

pkgname='cutefetch'
pkgdesc="A little fetch utility made with bare c and nice performance"
pkgver=0.1.0
pkgrel=1
arch=('any')
url="https://github.com/alphatechnolog/cutefetch"
source=("cutefetch::git+https://github.com/alphatechnolog/cutefetch.git")
makedepends=('clang' 'git')
license=("gpl")
sha256sums=(SKIP)
depends=()

build() {
  cd cutefetch
  make CC=clang
}

package() {
  cd cutefetch
  make DESTDIR="${pkgdir}/usr/bin" install
}
