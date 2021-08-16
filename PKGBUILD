# Maintainer: AkinoKaede <autmaple@protonmail.com>

pkgname=v2ray-browserforwarder
pkgver=4.41.1
pkgrel=1
pkgdesc="The browser forwarder resources of v2ray"
arch=('any')
url="https://github.com/v2fly/v2ray-core"
conflicts=("v2ray-extra")
license=('MIT')
source=("v2ray-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d47c1ce4e1b1340c404394b75fd6e4c4a74dcb2d135b55669b7eb88d32cdbe49e8e46d3daee0b9c9d0a881e219f111e28db5ca45fc4ee3bc2388d3937acb88e8')
package() {
    cd "${srcdir}"/"v2ray-core-${pkgver}"/
    install -Dm644 release/extra/browserforwarder/* -t "${pkgdir}"/usr/share/v2ray/browserforwarder/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
