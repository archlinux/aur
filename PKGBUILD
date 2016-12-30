# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=QualityHighlighter
pkgname=keepass-plugin-qualityhighlighter
pkgver=1.2
pkgrel=1
pkgdesc="KeePass plugin that highlights entries based on their password quality"
license=('GPL')
depends=('keepass')
arch=('any')
url="https://github.com/sdrichter/QualityHighlighter/"
source=("https://github.com/sdrichter/${_pkgname}/releases/download/v${pkgver}/${_pkgname}.plgx")
sha512sums=('e38fb77ab4cce11abeb13f7dcaaf5ea6856d4ad3d26be2b75f5944832844345f10ea3ecc1f64d4c29bb6e0713371531649c4f263b61beb020b8ae9da4d6801ea')

package() {
    install -Dm644 "${srcdir}"/${_pkgname}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname}.plgx
}
