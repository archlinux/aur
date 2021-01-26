# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2021.01.25_22.56.05
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

sha256sums=('b86397da48ebd1a4436e634ea73149d21c74f78b92e43ba31fb6738f3eca7ae2')

package() {
    install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/clojure-lsp"
}
