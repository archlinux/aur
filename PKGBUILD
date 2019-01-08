# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=scg
pkgdesc="Set Color from Gamma-values in X"
pkgver=1.0
pkgrel=2
arch=('x86_64')
url="https://github.com/jumper149/scg"
license=('Apache')
makedepends=('libx11' 'libxrandr')
source=('git+https://github.com/jumper149/scg.git')
_gitname="scg"
sha256sums=('SKIP')

build() {
  cd "${_gitname}"
  make
}

package() {
  cd "${_gitname}"
  make install DESTDIR="${pkgdir}"
}
