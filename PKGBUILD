# Maintainer: Dani Rybe <danilrybakov249 at gmail dot com>

pkgname="smh-bin"
pkgver="0.2.1"
pkgrel=1
pkgdesc="String manipulationg tool written in haskell"
arch=("x86_64")
license=("MIT")
depends=("gmp")
url="https://github.com/DanRyba253/smh"

_url="https://github.com/DanRyba253/smh"

source=("${_url}/releases/download/v${pkgver}/smh-${pkgver}" "${_url}/releases/download/v${pkgver}/smh-manpage-${pkgver}")
sha256sums=("4f4f300a0986e7974a88a764101a66efc89e3dfa872dae81c37957ea15b2d424" "eddab6cd6a2cda66c64a439dd270d275252d8cf36450885d9551e289f885847d")

package() {
    chmod +x "${srcdir}/smh-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/smh-${pkgver}" "${pkgdir}/usr/bin/smh"

    mkdir -p "${pkgdir}/usr/share/man/man1"
    cp "${srcdir}/smh-manpage-${pkgver}" "${pkgdir}/usr/share/man/man1/smh.1"
}


