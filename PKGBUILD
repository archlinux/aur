# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2021.06.01_16.19.44
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

sha256sums_x86_64=('8fbb3def8447e4a23b1da30054e29f586cee09589364654d4b994b7b8d72f0f4')

package() {
    install -Dm755 ${srcdir}/clojure-lsp "${pkgdir}/usr/bin/clojure-lsp"
}
