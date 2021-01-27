# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2021.01.26_22.35.27
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

sha256sums=('aab8ab3c325e83b2282a4d6f0e93dd04e4a5c863e36573bd43a4e54b78e75ed2')

package() {
    install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/clojure-lsp"
}
