pkgname=oldschool-pc-fonts
pkgver=2.0
pkgrel=1
pkgdesc="world's biggest collection of classic text mode fonts, system fonts and BIOS fonts from DOS-era IBM PCs and compatibles"
url="https://int10h.org/oldschool-pc-fonts/"
arch=('any')
license=('CCPL')
makedepends=('fontconfig')
source=("https://int10h.org/oldschool-pc-fonts/download/oldschool_pc_font_pack_v${pkgver}_ttf.zip")
md5sums=('91c7b424b327a99cd517226ca1ad5024')
 
package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/fonts/TTF"
    cp */*ttf "${pkgdir}/usr/share/fonts/TTF"
}
