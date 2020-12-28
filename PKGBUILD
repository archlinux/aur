# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=20201228T020543
pkgrel=1
pkgdesc="Language Server (LSP) for Clojure"
arch=("x86_64")
url="https://github.com/snoe/clojure-lsp"
license=("MIT")
depends=("clojure")
provides=('clojure-lsp')
conflicts=('clojure-lsp')

source=("${pkgname}-${pkgver}::https://github.com/clojure-lsp/clojure-lsp/releases/download/release-${pkgver}/clojure-lsp")

sha256sums=('71153f44f0039fefa080fd71db10eadf1c2c333deb7ee677337f10f43c1d61cd')

package() {
    install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/clojure-lsp"
}
