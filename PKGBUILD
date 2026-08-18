# Maintainer: Acuilan Gabriel <acuilangabriel at gmail dot com>

pkgname=crib-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Dev containers without the ceremony"
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
sha256sums=('9a6655fd7f0158ffb088575f24e6652a56d33126d17d09b4fd44e9c4ff4200ec')

package() {
    install -Dm755 "crib" "${pkgdir}/usr/bin/crib"
}
