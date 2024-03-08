# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>
pkgname=popeye-bin
pkgver=0.20.5
pkgrel=1
pkgdesc='A Kubernetes cluster resource sanitizer'
arch=('x86_64')
url='https://github.com/derailed/popeye'
license=('Apache 2')
provides=('popeye')
source=("https://github.com/derailed/popeye/releases/download/v${pkgver}/popeye_Linux_amd64.tar.gz")
sha256sums=('c2022a4ca7dd0b6062c5c87524bd6274519686f66534b6261be617dba97c5ecd')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/popeye" "${pkgdir}/usr/bin/popeye"
}
