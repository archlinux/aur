# $Id$
# Maintainer: lxz <lxz@ilxz.me>

pkgname=dde-network-utils
pkgver=0.0.0
pkgrel=1
pkgdesc="Deepin network utils"
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-network-utils"
license=('GPL3')
groups=('deepin')
makedepends=('git')
source=("${pkgname}"::'git+https://github.com/linuxdeepin/dde-network-utils.git')
sha512sums=('SKIP')

build() {
  cd ${pkgname}
  git checkout 1e4bcc0
  qmake
  make -j4
}

package() {
  cd ${pkgname}
  make install
}
