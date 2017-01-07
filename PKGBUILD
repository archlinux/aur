# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=QuickSearch
pkgname=keepass-plugin-quicksearch
pkgver=2.27
pkgrel=1
pkgdesc="KeePass plugin providing enhanced search capabilities"
license=('GPL')
depends=('keepass')
arch=('any')
url="https://github.com/iamkarlson/keepass-quicksearch"
source=("https://github.com/iamkarlson/keepass-quicksearch/releases/download/${pkgver}/${_pkgname}.plgx")
sha512sums=('343d8222d8dcbf9f2dc927b1500e72e019cb9f5ec4e23e7c301cdfbc6b542c497e2e02e117b55f92083103310c7cc87614d7a0d50a8925cc8dddf798b40fb789')

package() {
    install -Dm644 "${srcdir}"/${_pkgname}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname}.plgx
}
