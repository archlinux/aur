# Maintainer: Patrick Young <16604643+kmahyyg@users.noreply.github.com>
pkgname=pb-go
pkgver=1.0.5
pkgrel=1
pkgdesc="A golang-based simple and powerful pastebin server named pb-go"
arch=('x86_64')
url="https://github.com/pb-go/pb-go"
license=('AGPL3')
makedepends=('xz')
options=("!strip")
source=(
    "https://github.com/pb-go/pb-go/releases/download/v${pkgver}/pb-go-linux-amd64.xz"
)
sha256sums=(
    '7efbc440c6fafa078a24a40c52341e1481a7a01af8573d576483d6ffd3418032'
)
package() {
    install -Dm755 "pb-go-linux-amd64" "${pkgdir}/usr/bin/pb-go"
}
