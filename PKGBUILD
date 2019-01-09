# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=scg
pkgdesc="Set Color from Gamma-values in X"
pkgver=1.0
pkgrel=3
arch=('x86_64')
url="https://github.com/jumper149/scg"
license=('Apache')
makedepends=('libx11' 'libxrandr')
source=("https://github.com/jumper149/scg/archive/v${pkgver}.tar.gz")
_gitname="scg"
sha256sums=('dab6eb6075cf24e0bbcd5b08089815bf88f58269b885643418c9d6a4ca07a39b')

build() {
  cd "${_gitname}"
  make
}

package() {
  cd "${_gitname}"
  make install DESTDIR="${pkgdir}"
}
