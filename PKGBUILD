# Maintainer: <d.r.vanrossum AT gmx DOT de>

pkgname=ttf-sbl-biblit
pkgver=1.0_Build001
pkgrel=3
pkgdesc="SBL biblical font, including SBL Greek, SBL Hebrew, and transliteration glyphs"
arch=('any')
url="https://www.sbl-site.org/educational/BiblicalFonts_SBLBibLit.aspx"
license=('custom')
source=("https://www.sbl-site.org/wp-content/themes/basket/fonts/bib-fonts/SBL_BLit.ttf"
        "https://www.sbl-site.org/wp-content/uploads/2024/05/SBL_Font_End_User_License_Agreement.pdf")
sha256sums=('bfd1ed38833f112d9998d5631c533ef347ad0affc6b600220d50123a7816a814'
            '70c6d5d0f95a97c80f348e5dc22ac647a4b591a5cf6d5021a0588563eed844ed')

package() {
  cd "$srcdir"
  install -Dm644 SBL_BLit.ttf "$pkgdir/usr/share/fonts/TTF/SBL_BLit.ttf"
  install -Dm644 SBL_Font_End_User_License_Agreement.pdf "$pkgdir/usr/share/licenses/$pkgname/SBL_Font_End_User_License_Agreement.pdf"
}
