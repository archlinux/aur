# Maintainer: Acuilan Gabriel <acuilangabriel at gmail dot com>

pkgname=crib-bin
pkgver=0.9.1
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
sha256sums=('8e52b4725d030861c47821492b79c560688ddd9e0c0fbf5ce9d93a051683dcbc')

package() {
    install -Dm755 "crib" "${pkgdir}/usr/bin/crib"
}
