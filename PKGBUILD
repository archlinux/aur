# Maintainer: AkinoKaede <autmaple@protonmail.com>

pkgname=v2ray-extra
pkgver=4.38.3
pkgrel=1
pkgdesc="The extra resources of v2ray"
arch=('any')
url="https://github.com/v2fly/v2ray-core"
license=('MIT')
source=("v2ray-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=("90f2ee74bd1cc4e0ac3515e5fb50d146716fa6e3ae2c518cd34ef469afd963f51df5b7ef92f43675d2b085883d98cad193d2811e64b522ecb0299dfd0fa480fe")
package() {
    cd "${srcdir}"/"v2ray-core-${pkgver}"/
    install -Dm644 release/extra/browserforwarder/* -t "${pkgdir}"/usr/share/v2ray/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
