# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>
# Contributer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=clojure-lsp-bin
pkgver=20200620T053227
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("https://github.com/snoe/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")

sha256sums=('15b7b2be7098765310705f2e4fd0418566bd52cc0657c069c7271ffc88032a36')

package() {
    install -Dm755 clojure-lsp "${pkgdir}/usr/bin/clojure-lsp"
}
