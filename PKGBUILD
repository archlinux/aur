# Contributor: orumin <dev@orum.in>

pkgname=the-ultimate-oldschool-pc-fonts
pkgver=1.0
pkgrel=2
pkgdesc="World's biggest collection of classic text mode fonts, system fonts and BIOS fonts from DOS-era IBM PCs and compatibles"
arch=('any')
url="http://int10h.org/oldschool-pc-fonts/"
license=('CUSTOM')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=ttf.install
source=('http://int10h.org/oldschool-pc-fonts/download/ultimate_oldschool_pc_font_pack_v1.0.zip')
md5sums=('24acf70a302419895544e32757cfe4c8')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/oldschool-pc-Px437/"
    cp "Px437 (TrueType - DOS charset)"/* "${pkgdir}/usr/share/fonts/oldschool-pc-Px437/"
    install -d "${pkgdir}/usr/share/fonts/oldschool-pc-PxPlus/"
    cp "PxPlus (TrueType - extended charset)"/* "${pkgdir}/usr/share/fonts/oldschool-pc-PxPlus/"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
