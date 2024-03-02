# Maintainer: Dani Rybe <danilrybakov249 at gmail dot com>

pkgname="smh-bin"
pkgver="0.1.1"
pkgrel=1
pkgdesc="String manipulationg tool written in haskell"
arch=("x86_64")
license=("MIT")
depends=("gmp")

_url="https://github.com/DanRyba253/smh"

source=("${_url}/releases/download/v${pkgver}/smh" "${_url}/releases/download/v${pkgver}/smh-manpage")
sha256sums=("95d553cbcfc2ad258945729b46782e2ec0ba38943b1520da27372a72556d28e3" "8aa7fe53e59075321b981a010837aaf6455a3d69deebf5fb830670a55f79d519")

package() {
    chmod +x "${srcdir}/smh"
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/smh" "${pkgdir}/usr/bin/smh"

    mkdir -p "${pkgdir}/usr/share/man/man1"
    cp "${srcdir}/smh-manpage" "${pkgdir}/usr/share/man/man1/smh.1"
}


