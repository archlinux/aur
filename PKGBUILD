# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2021.01.20_01.39.32
pkgrel=1
epoch=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("${pkgname}-${pkgver}::https://github.com/clojure-lsp/clojure-lsp/releases/download/${pkgver//_/-}/clojure-lsp")

sha256sums=('de14804d3103672a6742818f560e2d9c66d9a973776ae4c19488734879e79973')

package() {
    install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/clojure-lsp"
}
