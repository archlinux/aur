# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rats-search-bin
_pkgname=rats-search
pkgver=1.10.0
pkgrel=1
pkgdesc="BitTorrent P2P multi-platform search engine for Desktop and Web servers with integrated torrent client."
arch=('x86_64')
url="https://github.com/DEgITx/rats-search"
license=('MIT')
providers=(DEgITx)
options=()
conflicts=('rats-search-appimage')
depends=(gtk3 at-spi2-core alsa-lib lib32-gcc-libs nss openssl-1.1 lib32-zlib)
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('9033d13f3c97b5ff367297b96a7249b26474db1caf5bc76ff0ede301ae47aad7')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}
