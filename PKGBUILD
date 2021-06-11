# Maintainer: Alexander Fasching <fasching.a91@gmail.com>

pkgname=steam-fonts
pkgver=1.0.0
pkgrel=6
pkgdesc="Fonts to fix scrambled or missing text in steam menus"
arch=('any')
url="https://support.steampowered.com/kb_article.php?ref=1974-YFKL-4947"
license=('custom')
source=("https://support.steampowered.com/downloads/1974-YFKL-4947/SteamFonts.zip")
sha1sums=('1135b3d9c5334082f9f95999a8f0e8f8be4cb057')

package() {
    cd ${srcdir}
    mkdir -p "${pkgdir}/usr/share/fonts/steam-fonts"
    cp *.ttf *.TTF "${pkgdir}/usr/share/fonts/steam-fonts/"
}
