# Maintainer: Sarat Chandra <me at saratchandra dot in>

pkgname=torrentinim-bin
_pkgver=0.3.1
pkgver=v${_pkgver}
pkgrel=1
pkgdesc="Torrentinim is a self-hosted API-only, low memory footprint, torrent search engine and crawler."
arch=('x86_64')
url="https://github.com/sergiotapia/torrentinim"
license=('MIT')
depends=()
makedepends=()
provides=('torrentinim')
source_x86_64=("https://github.com/sergiotapia/torrentinim/releases/download/${pkgver}/Torrentinim_linux.tar.gz")
sha256sums_x86_64=('0559b51daa4b499f5ec6b3a65e5fa052dfde739d66ae866eab156d78675a070d')

package() {
    cd "${srcdir}"

    # Install doggo
    install -D -m0755 Torrentinim_linux/torrentinim \
        "${pkgdir}/usr/bin/torrentinim"
}
