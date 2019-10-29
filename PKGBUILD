# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>
# Contributer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clojure-lsp-bin
pkgver=20191029T220244
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("https://github.com/snoe/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")

sha256sums=('f4e27d9897c685260a915b596f37a5227a21828210994ab7fed9d64fa74606c9')

package() {
    install -Dm755 clojure-lsp "${pkgdir}/usr/bin/clojure-lsp"
}
