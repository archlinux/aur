# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=listen1
pkgver=2.32.0
pkgrel=1
pkgdesc="  One for all free music in China"
arch=("x86_64")
url="https://github.com/listen1/listen1_desktop"
license=('MIT')
depends=()
provides=('listen1')
conflicts=('listen1-electron')
source=(
  https://github.com/$pkgname/$pkgname\_desktop/releases/download/v$pkgver/$pkgname\_$pkgver\_linux_amd64.deb)
sha256sums=('5ac63be98672a30850a97765e6474ea95ce0cb5a9330eee6d6d1db62860a1916')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
} 
