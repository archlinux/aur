# Maintainer: Dani Rybe <danilrybakov249 at gmail dot com>

pkgname="smh-bin"
pkgver="0.2.0"
pkgrel=1
pkgdesc="String manipulationg tool written in haskell"
arch=("x86_64")
license=("MIT")
depends=("gmp")
url="https://github.com/DanRyba253/smh"

_url="https://github.com/DanRyba253/smh"

source=("${_url}/releases/download/v${pkgver}/smh-${pkgver}" "${_url}/releases/download/v${pkgver}/smh-manpage-${pkgver}")
sha256sums=("851e48f658cba8966b99285ead6151ab6b18a7e3f86e37fed5affee8a0342420" "d19eef6917ea1bf20078eceef9689fe7cf301db185bff87259d0b962d920c0ad")

package() {
    chmod +x "${srcdir}/smh-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/smh-${pkgver}" "${pkgdir}/usr/bin/smh"

    mkdir -p "${pkgdir}/usr/share/man/man1"
    cp "${srcdir}/smh-manpage-${pkgver}" "${pkgdir}/usr/share/man/man1/smh.1"
}


