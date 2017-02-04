# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=QuickSearch
pkgname=keepass-plugin-quicksearch
pkgver=2.28
pkgrel=1
pkgdesc="KeePass plugin providing enhanced search capabilities"
license=('GPL')
depends=('keepass')
arch=('any')
url="https://github.com/iamkarlson/keepass-quicksearch"
source=("https://github.com/iamkarlson/keepass-quicksearch/raw/master/Releases/Build%20Outputs/${_pkgname}.plgx")
sha512sums=('f4fea434fe1e35984e8f221b67905145f902130192bfdd1967ecc3c2cc96fb320c89907a0213806e347c9eb95e827f33634c5eb928b198d765056edc58e7e718')

package() {
    install -Dm644 "${srcdir}"/${_pkgname}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname}.plgx
}
