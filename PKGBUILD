# Maintainer: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>
# Contributor: calzonealamuerte <wilburn22 at messageden dot com>

pkgname=cliphist-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='clipboard history “manager” for wayland'
arch=('x86_64')
url="https://github.com/sentriz/cliphist"
license=('GPL3')
provides=('cliphist')
conflicts=('cliphist')
depends=('wl-clipboard')
optdepends=('xdg-utils: for image mime inferance')
source=("${url}/releases/download/v${pkgver}/v${pkgver}-linux-amd64")
sha256sums=('79c9f7ff1a6b6c4ed68d9879034afe08e6520a47071e4b284a9fb5750d30c2dd')

package() {
    install -Dm755 "${srcdir}/v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/cliphist"
}
