# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2021.02.19_00.19.27
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

sha256sums_x86_64=('0d1598a41b98a198e86ecf4a0f5e1d5a4574a8d8960fe9618f844c49f4f763cb')

package() {
    install -Dm755 ${srcdir}/clojure-lsp "${pkgdir}/usr/bin/clojure-lsp"
}
