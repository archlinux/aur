# Maintainer: Acuilan Gabriel <acuilangabriel at gmail dot com>

pkgname=crib-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Crib reads your devcontainer.json config, builds the container, and gets out of your way"
arch=('x86_64')
url="https://github.com/fgrehm/crib"
license=('MIT')
optdepends=(
    'docker: for Docker runtime'
    'podman: for Podman runtime'
)
provides=('crib')
options=('!strip')
source=(
    "$pkgname-${pkgver}.tar.gz::https://github.com/fgrehm/crib/releases/download/v${pkgver}/crib_linux_amd64.tar.gz"
)
sha256sums=('0d63539fe141b79dc00837b9fb5aded71fe4841b3e9d7b545de80cc9d8132fbb')

package() {
    install -Dm755 "crib" "${pkgdir}/usr/bin/crib"
}
