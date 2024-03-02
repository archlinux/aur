# Maintainer: Dani Rybe <danilrybakov249 at gmail dot com>

pkgname="smh-bin"
pkgver="0.1.3"
pkgrel=1
pkgdesc="String manipulationg tool written in haskell"
arch=("x86_64")
license=("MIT")
depends=("gmp")
url="https://github.com/DanRyba253/smh"

_url="https://github.com/DanRyba253/smh"

source=("${_url}/releases/download/v${pkgver}/smh-${pkgver}" "${_url}/releases/download/v${pkgver}/smh-manpage-${pkgver}")
sha256sums=("39f890586c1f313ad141a9bb36857c39f4c614420ac1432082944219fc88188f" "31fd36354917c7186ffaa6b1e7b0e460fe7739e005ca91fd592d720b3ed8cb5f")

package() {
    chmod +x "${srcdir}/smh-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/smh-${pkgver}" "${pkgdir}/usr/bin/smh"

    mkdir -p "${pkgdir}/usr/share/man/man1"
    cp "${srcdir}/smh-manpage-${pkgver}" "${pkgdir}/usr/share/man/man1/smh.1"
}


