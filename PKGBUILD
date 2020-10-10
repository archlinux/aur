# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=20201009T224414
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("https://github.com/snoe/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")

sha256sums=('eab6eea0b3cc0b7816f1192f12d577f5390c1af7a0d949f48ade1bccc83ae8ab')

package() {
    install -Dm755 clojure-lsp "${pkgdir}/usr/bin/clojure-lsp"
}
