# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>
pkgname=popeye-bin
pkgver=0.11.1
pkgrel=1
pkgdesc='A Kubernetes cluster resource sanitizer'
arch=('x86_64')
url='https://github.com/derailed/popeye'
license=('Apache 2')
provides=('popeye')
source=("https://github.com/derailed/popeye/releases/download/v${pkgver}/popeye_Linux_x86_64.tar.gz")
sha256sums=('d4471c3f5a3636ce9effc7e5c5d1ebeab44f11e828e4677e31a925cab90b66ae')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/popeye" "${pkgdir}/usr/bin/popeye"
}
