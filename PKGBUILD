# Maintainer: AkinoKaede <autmaple@protonmail.com>

pkgname=v2ray-browserforwarder
pkgver=4.39.2
pkgrel=1
pkgdesc="The browser forwarder resources of v2ray"
arch=('any')
url="https://github.com/v2fly/v2ray-core"
conflicts=("v2ray-extra")
license=('MIT')
source=("v2ray-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=("eac92bfb63f7d2b465ad46ebf7d7e73639d1391c8715d6504624162dca05f632eb8bbed6c322713f08cd258d23cea82af86d1d97002bdf5fb3e61d30895e7d0b")
package() {
    cd "${srcdir}"/"v2ray-core-${pkgver}"/
    install -Dm644 release/extra/browserforwarder/* -t "${pkgdir}"/usr/share/v2ray/browserforwarder/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
