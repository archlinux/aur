# Contributor: orumin <dev@orum.in>

pkgname=ttf-koruri
pkgver=20141224
pkgrel=2
pkgdesc="Japanese TrueType font obtained by mixing M+ and Open Sans"
arch=('any')
url="http://sourceforge.jp/projects/koruri"
license=('APACHE')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror=iij
source=("Koruri-${pkgver}.tar.xz::http://osdn.jp/frs/redir.php?m=${_mirror}&f=%2Fkoruri%2F62469%2FKoruri-${pkgver}.tar.xz")
md5sums=('21b1e8b0a011649e37fddf0e2bf61305')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "Koruri-${pkgver}"/*.ttf "${pkgdir}/usr/share/fonts/TTF"
}
