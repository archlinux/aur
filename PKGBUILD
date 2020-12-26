# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=20201226T190643
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("${pkgname}-${pkgver}::https://github.com/snoe/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")

sha256sums=('e9632d0ec27a60ee3adfcb62dee4def7e45c8f043b2f3f7fee16c27cd8896578')

package() {
    install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/clojure-lsp"
}
