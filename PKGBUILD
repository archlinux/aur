# Maintainer: BearBobs <kapoor.anuj0@gmail.com>

pkgname=deepin-dock-plugin-netspeedandsysteminfo
pkgver=1.0.0
pkgrel=1
pkgdesc="A plugin for deepin dock, Displays Current Netspeed and General SystemInfo"
arch=('x86_64')
url="https://github.com/Bearbobs/deepin-dock-plugin-netspeedandsysteminfo"
depends=('deepin-dock' 'pacman-contrib')
makedepends=('git' 'qt5-base' 'qt5-tools' 'dtkcore')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bearbobs/deepin-dock-plugin-netspeedandsysteminfo/archive/${pkgver}.tar.gz")
md5sums=('88d6e4899c6f56fd675250bababd92b9')

build() {

  qmake "$srcdir/$pkgname-$pkgver/"
  make ${MAKEFLAGS}
}

package(){
  make INSTALL_ROOT="$pkgdir" install
}
