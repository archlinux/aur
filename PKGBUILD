# Maintainer: AkinoKaede <autmaple@protonmail.com>

pkgname=v2ray-browserforwarder
pkgver=4.40.1
pkgrel=1
pkgdesc="The browser forwarder resources of v2ray"
arch=('any')
url="https://github.com/v2fly/v2ray-core"
conflicts=("v2ray-extra")
license=('MIT')
source=("v2ray-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=("ef9a4f46fc0118793ae789151eb6e5792e96c97de5f19345c47b334ff1557b92306b731b2229b4dfd284263a205e6fb8bf29206ec32a94d875e6d3c20b6e6233")
package() {
    cd "${srcdir}"/"v2ray-core-${pkgver}"/
    install -Dm644 release/extra/browserforwarder/* -t "${pkgdir}"/usr/share/v2ray/browserforwarder/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
