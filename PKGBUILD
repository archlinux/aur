# Maintainer: AkinoKaede <autmaple@protonmail.com>

pkgname=v2ray-extra
pkgver=4.37.3
pkgrel=1
pkgdesc="The extra resources of v2ray"
arch=('any')
url="https://github.com/v2fly/v2ray-core"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}.zip")
sha256sums=("127ad21249d1f35a9760a938abe1b1b6d3042df21e62648b83150e4ea850bbe2")
package() {
    install -Dm644  "${srcdir}"/browserforwarder/* -t "${pkgdir}"/usr/share/v2ray/browserforwarder
}