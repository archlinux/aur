# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=clojure-lsp-bin
pkgver=2021.01.27_21.47.42
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

sha256sums=('91ba202e04b7f93446b4ab1c06bb08bc371f50054c8953db71b2fb62ac75b7d1')

package() {
    install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/clojure-lsp"
}
