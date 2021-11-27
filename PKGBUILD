# Maintainer: Apoorv <apoorvs569@gmail.com>

pkgname=bolliedelayxt.lv2
pkgver=1
pkgrel=1
pkgdesc="A lv2 delay plugin"
arch=('x86_64')
url="https://github.com/MrBollie/bolliedelayxt.lv2"
license=('GPL3')
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make -j4
}

package() {
  cd "$srcdir/$pkgname"
  sudo make install
}
