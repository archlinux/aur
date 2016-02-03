# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=oldschool-pc-fonts
pkgver=1.0
pkgrel=1
pkgdesc="world's biggest collection of classic text mode fonts, system fonts and BIOS fonts from DOS-era IBM PCs and compatibles"
url="http://int10h.org/oldschool-pc-fonts/"
arch=('any')
license=('CC BY-SA 4.0')
makedepends=('fontconfig' 'xorg-font-utils')
install=${pkgname}.install
source=("http://int10h.org/oldschool-pc-fonts/download/ultimate_oldschool_pc_font_pack_v1.0.zip"
        "${pkgname}.install")
md5sums=('24acf70a302419895544e32757cfe4c8'
         'f7d35c6d77e5a0b960714b010841fb81')
 
package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/fonts/TTF"
    cp */*ttf "${pkgdir}/usr/share/fonts/TTF"
}
