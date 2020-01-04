# Maintainer: Don Pinkster <archlinux@pinkster.me>
pkgname=popeye-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='A Kubernetes cluster resource sanitizer'
arch=('x86_64')
url='https://github.com/derailed/popeye'
license=('Apache')
provides=('popeye')
source=("https://github.com/derailed/popeye/releases/download/v${pkgver}/popeye_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('a0c2cf9f4dc3d431cefa79708ea6d3d0eead2b62ac5f5ee70f37cc2d651a62a7')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/popeye" "${pkgdir}/usr/bin/popeye"
}
