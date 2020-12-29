# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2020.12.29_20.42.24
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("${pkgname}-${pkgver}::https://github.com/clojure-lsp/clojure-lsp/releases/download/${pkgver//_/-}/clojure-lsp")

sha256sums=('81f31b7d02d510cba0ede451ac213cdb3c32b6c255fc687c0e39d0e1448301f0')

package() {
    install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/clojure-lsp"
}
