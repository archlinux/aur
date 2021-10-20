# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2021.10.20_13.04.11
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

sha256sums_x86_64=('230310e0112229a3d16939626b1f13904378db434340eff6c6f094f66fc96074')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
