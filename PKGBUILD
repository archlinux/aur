# Maintainer: AkinoKaede <autmaple@protonmail.com>

pkgname=v2ray-extra
pkgver=4.38.3
pkgrel=2
pkgdesc="The extra resources of v2ray"
arch=('any')
url="https://github.com/v2fly/v2ray-core"
license=('MIT')
source=("v2ray-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=("e6089b346850fc61a4a135a2f86c4966ebf472737422676a9c40151323e2df9619e5fcea9e9ea345a8735bdba53e212cb502d7c76c2d359284624962b560ee1d")
package() {
    cd "${srcdir}"/"v2ray-core-${pkgver}"/
    install -Dm644 release/extra/browserforwarder/* -t "${pkgdir}"/usr/share/v2ray/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
