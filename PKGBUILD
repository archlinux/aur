# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=listen1
pkgver=2.30.0
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
sha256sums=('34c6c584dc55d722ab6c3e31ad0b0f2b423caf00c40012d010ab36c10770e512')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
} 
