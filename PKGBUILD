# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2021.01.25_17.22.05
pkgrel=1
epoch=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/clojure-lsp/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("${pkgname}-${pkgver}::${url}/releases/download/${pkgver//_/-}/clojure-lsp")

sha256sums=('9f08da13e843cb6900409aac4f42918f580b5c8708f86fcfef1526646e291103')

package() {
    install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/clojure-lsp"
}
