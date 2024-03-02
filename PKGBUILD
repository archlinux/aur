# Maintainer: Dani Rybe <danilrybakov249 at gmail dot com>

pkgname="smh-bin"
pkgver="0.1.2"
pkgrel=2
pkgdesc="String manipulationg tool written in haskell"
arch=("x86_64")
license=("MIT")
depends=("gmp")

_url="https://github.com/DanRyba253/smh"

source=("${_url}/releases/download/v${pkgver}/smh" "${_url}/releases/download/v${pkgver}/smh-manpage")
sha256sums=("fcb94c683cd9e1bdc205a57e801843434173d410f14be0eb3612f07d127427fe" "cf63ee4dcdcbccd9183a6788a797323a8c153407600500e4ded96e0df9b2d8fc")

package() {
    chmod +x "${srcdir}/smh"
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/smh" "${pkgdir}/usr/bin/smh"

    mkdir -p "${pkgdir}/usr/share/man/man1"
    cp "${srcdir}/smh-manpage" "${pkgdir}/usr/share/man/man1/smh.1"
}


