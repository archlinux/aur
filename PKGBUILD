# Maintainer: Drommer <drommer@github.com>

pkgname=ttf-xo-fonts
pkgver=22.12
pkgrel=1
pkgdesc='XO by MyOffice provide metric-compatible fonts with Microsoft to display documents without distortion and violation of the structure'
arch=('any')
url='https://myoffice.ru'
license=('custom')
provides=('ttf-font' 'ttf-xo-caliburn' 'ttf-xo-courser' 'ttf-xo-oriel' 'ttf-xo-symbol' 'ttf-xo-tahion' 'ttf-xo-thames' 'ttf-xo-trebizond' 'ttf-xo-verbena' 'ttf-xo-windy')
conflicts=('ttf-xo-caliburn' 'ttf-xo-courser' 'ttf-xo-oriel' 'ttf-xo-oriel-condensed' 'ttf-xo-symbol' 'ttf-xo-symbol-mac' 'ttf-xo-tahion' 'ttf-xo-thames' 'ttf-xo-windy')
source=("https://myoffice.ru/files/fonts/all_fonts_myoffice.zip"
        "license.txt")
sha256sums=('9152219ce09626511f824be105f512e687604f0311c130f234c67bd1a7395fe9'
            'a803b8232be71863ea0c36fc40b67a32aa9f4cd1a33fca01738a3727632e6f22')

pkgver() {
  date +%y.%m
}

package() {
  install -Dm644 $srcdir/XO_Caliburn/XO_Caliburn/TTF/*.ttf -t $pkgdir/usr/share/fonts/XO/Caliburn
  install -Dm644 $srcdir/XO_Courser/XO_Courser/TTF/*.ttf -t $pkgdir/usr/share/fonts/XO/Courser
  install -Dm644 $srcdir/XO_Oriel/XO_Oriel/TTF/*.ttf -t $pkgdir/usr/share/fonts/XO/Oriel
  install -Dm644 $srcdir/XO_Symbol/*.ttf -t $pkgdir/usr/share/fonts/XO
  install -Dm644 $srcdir/XO_SymbolM/*.ttf -t $pkgdir/usr/share/fonts/XO
  install -Dm644 $srcdir/XO_Tahion/XO_Tahion/TTF/*.ttf -t $pkgdir/usr/share/fonts/XO/Tahion
  install -Dm644 $srcdir/XO_Thames/XO_Thames/TTF/*.ttf -t $pkgdir/usr/share/fonts/XO/Thames
  install -Dm644 $srcdir/XO_Trebizond/*.ttf -t $pkgdir/usr/share/fonts/XO
  install -Dm644 $srcdir/XO_Verbena/*.ttf -t $pkgdir/usr/share/fonts/XO
  install -Dm644 $srcdir/XO_Windy/*.ttf -t $pkgdir/usr/share/fonts/XO
  install -Dm644 $srcdir/license.txt -t $pkgdir/usr/share/licenses/${pkgname}
}
