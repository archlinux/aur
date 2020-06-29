pkgname=oldschool-pc-fonts
pkgver=1.01
pkgrel=1
pkgdesc="world's biggest collection of classic text mode fonts, system fonts and BIOS fonts from DOS-era IBM PCs and compatibles"
url="https://int10h.org/oldschool-pc-fonts/"
arch=('any')
license=('CCPL')
makedepends=('fontconfig')
source=("https://int10h.org/oldschool-pc-fonts/download/ultimate_oldschool_pc_font_pack_v${pkgver}.zip")
md5sums=('7f3dc5d7fbfebad7f893da57d4986452')
 
package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/fonts/TTF"
    cp */*ttf "${pkgdir}/usr/share/fonts/TTF"
}
