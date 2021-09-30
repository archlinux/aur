# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2021.09.30_15.28.01
pkgrel=1
epoch=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/clojure-lsp/clojure-lsp"
license=("MIT")
depends=('gcc-libs' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${pkgname}-${pkgver}-native-linux-amd64.zip::${url}/releases/download/${pkgver//_/-}/clojure-lsp-native-linux-amd64.zip")

sha256sums_x86_64=('c3ba76600d58cd05f174cb5505b4f95bf11860ac33e08be389d26820d5b03290')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
