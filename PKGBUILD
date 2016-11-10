# Contributor: orumin <dev@orum.in>

pkgname=ttf-koruri
pkgver=20161105
pkgrel=1
pkgdesc="Japanese TrueType font obtained by mixing M+ and Open Sans"
arch=('any')
url="http://osdn.jp/projects/koruri"
license=('APACHE')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror=iij
source=("Koruri-${pkgver}.tar.xz::http://osdn.jp/frs/redir.php?m=${_mirror}&f=%2Fkoruri%2F66647%2FKoruri-${pkgver}.tar.xz")
md5sums=('4fa941081153bc1e35b08fea11fe7926')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "Koruri-${pkgver}"/*.ttf "${pkgdir}/usr/share/fonts/TTF"
}
