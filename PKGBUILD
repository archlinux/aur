# Contributor: orumin <dev@orum.in>

pkgname=ttf-ohruri
pkgver=20150606
pkgrel=1
pkgdesc="Japanese TrueType font obtained by mixing Mgen+ and Open Sans"
arch=('any')
url="http://osdn.jp/projects/koruri"
license=('APACHE')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="iij"
source=("Ohruri-${pkgver}.tar.xz::http://osdn.jp/frs/redir.php?m=${_mirror}&f=%2Fkoruri%2F63358%2FOhruri-${pkgver}.tar.xz")
md5sums=('18edece40298e08f90e4b1a27b2ba645')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "Ohruri-${pkgver}"/*.ttf "${pkgdir}/usr/share/fonts/TTF"
}
