# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>
pkgname=popeye-bin
pkgver=0.22.0
pkgrel=1
pkgdesc='A Kubernetes cluster resource sanitizer'
arch=('x86_64')
url='https://github.com/derailed/popeye'
license=('Apache 2')
provides=('popeye')
source=("https://github.com/derailed/popeye/releases/download/v${pkgver}/popeye_Linux_amd64.tar.gz")
sha256sums=('e43c6b80039f1e38ace65cb5b17f9180638e5b72f252c4a42df96a45a3308c47')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/popeye" "${pkgdir}/usr/bin/popeye"
}
