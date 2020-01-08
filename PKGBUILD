# Maintainer: Don Pinkster <archlinux@pinkster.me>
pkgname=popeye-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='A Kubernetes cluster resource sanitizer'
arch=('x86_64')
url='https://github.com/derailed/popeye'
license=('Apache')
provides=('popeye')
source=("https://github.com/derailed/popeye/releases/download/v${pkgver}/popeye_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('55237cf2f3ee5f1e7fe035be8dc8eb10157663d2a8cad47a51744fdc21f461c5')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/popeye" "${pkgdir}/usr/bin/popeye"
}
