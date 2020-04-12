# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>
# Contributer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clojure-lsp-bin
pkgver=20200412T033138
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("https://github.com/snoe/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")

sha256sums=('ac0043ac24375890e858f5c26826ce5ae0e2d9c271fda916fbb8f4f266d426a6')

package() {
    install -Dm755 clojure-lsp "${pkgdir}/usr/bin/clojure-lsp"
}
