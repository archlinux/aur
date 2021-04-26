# Maintainer: AkinoKaede <autmaple@protonmail.com>

pkgname=v2ray-extra
pkgver=4.37.3
pkgrel=2
pkgdesc="The extra resources of v2ray"
arch=('any')
url="https://github.com/v2fly/v2ray-core"
license=('MIT')
source=("v2ray-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=("303df7373811a613a962358a080f6de3d661401b8eaf9c8c7b665e540938655dd01c6b134cb127be0d183f800b7cb992c22d571aac2e580fefedeb68cd871eae")
package() {
    cd "${srcdir}"/"v2ray-core-${pkgver}"/
    install -Dm644 release/extra/browserforwarder/* -t "${pkgdir}"/usr/share/v2ray/browserforwarder/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}