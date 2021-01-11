# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2021.01.11_00.08.10
pkgrel=1
epoch=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("${pkgname}-${pkgver}::https://github.com/clojure-lsp/clojure-lsp/releases/download/${pkgver//_/-}/clojure-lsp")

sha256sums=('0ba1adac894c4a47fa293ff505a77002325f7d940269a36e121ba23ec75d041a')

package() {
    install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/clojure-lsp"
}
