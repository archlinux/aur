# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=hoptodesk
pkgver=0.1
pkgrel=1
pkgdesc="A Remote Desktop Software free for personal and commercial use."
arch=("x86_64")
url="https://www.hoptodesk.com/"
license=('AGPL-3.0')
source=(https://www.hoptodesk.com/hoptodesk.deb)
sha256sums=('3a56b980882fa88d59acc4ab54045ef8f7e9aec53c1070f21facdb275a7811ab')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
} 
