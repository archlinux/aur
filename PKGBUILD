# Maintainer: Gabriel Guerra <gfranklings@gmail.com>

pkgname='cutefetch'
pkgdesc="A little fetch utility made with bare c and nice performance"
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/alphatechnolog/cutefetch"
source=("cutefetch::git+https://github.com/alphatechnolog/cutefetch.git")
makedepends=('base-devel' 'gcc' 'make')
sha256sums=(SKIP)
depends=()

build() {
  cd cutefetch && make
}

package() {
  cd cutefetch && make PREFIX="${pkgdir}/usr/" install
}
