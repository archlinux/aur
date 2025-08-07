# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>
pkgname=popeye-bin
pkgver=0.22.1
pkgrel=1
pkgdesc='A Kubernetes cluster resource sanitizer'
arch=('x86_64')
url='https://github.com/derailed/popeye'
license=('Apache 2')
provides=('popeye')
source=("https://github.com/derailed/popeye/releases/download/v${pkgver}/popeye_Linux_amd64.tar.gz")
sha256sums=('d58a3c0ba45805d452c32628320eecdcb5172fd5f42c82e12aeecc7a17eb930b')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/popeye" "${pkgdir}/usr/bin/popeye"
}
