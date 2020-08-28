# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=20200828T065654
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("https://github.com/snoe/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")

sha256sums=('c25969a376498594a232912f317d40d6b7002d3d706c19fc57fb2c6b99ec298d')

package() {
    install -Dm755 clojure-lsp "${pkgdir}/usr/bin/clojure-lsp"
}
