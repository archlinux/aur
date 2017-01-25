# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=QualityHighlighter
pkgname=keepass-plugin-qualityhighlighter
pkgver=1.3.0.1
pkgrel=1
pkgdesc="KeePass plugin that highlights entries based on their password quality"
license=('GPL')
depends=('keepass')
arch=('any')
url="https://github.com/sdrichter/QualityHighlighter/"
source=("https://github.com/sdrichter/${_pkgname}/releases/download/v${pkgver}/${_pkgname}.plgx")
sha512sums=('c55175f4486e0dd1ffff67e4c4b9f95e8f745d42470cd695b32857213c0029f04c1ddfd8897d922935158f844447ca03d998218bc46a6699c776e5a15efbdc1a')

package() {
    install -Dm644 "${srcdir}"/${_pkgname}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname}.plgx
}
