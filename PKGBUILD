# Maintainer: Don Pinkster <archlinux@pinkster.me>
pkgname=popeye-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='A Kubernetes cluster resource sanitizer'
arch=('x86_64')
url='https://github.com/derailed/popeye'
license=('Apache')
provides=('popeye')
source=("https://github.com/derailed/popeye/releases/download/v${pkgver}/popeye_Linux_x86_64.tar.gz")
sha256sums=('d4d7d776e05a0de5b681cb5421e3d9884103b902142313d8371e4f5e6b3d66dd')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/popeye" "${pkgdir}/usr/bin/popeye"
}
