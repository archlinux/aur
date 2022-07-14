# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>
pkgname=popeye-bin
pkgver=0.10.1
pkgrel=1
pkgdesc='A Kubernetes cluster resource sanitizer'
arch=('x86_64')
url='https://github.com/derailed/popeye'
license=('Apache 2')
provides=('popeye')
source=("https://github.com/derailed/popeye/releases/download/v${pkgver}/popeye_Linux_x86_64.tar.gz")
sha256sums=('a7d57a70de146b22e54b6c6e110930c19d98a920d55d32a1379db721f686f166')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/popeye" "${pkgdir}/usr/bin/popeye"
}
