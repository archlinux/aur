# Maintainer: Ward Segers <w@rdsegers.be>
# Contributer: Dennis Fink <metalgamer@c3l.lu>
# Contributer: Tobias Frilling <tobias@frilling-online.de>

pkgname=ttf-breeze-sans
pkgver=20150728
pkgrel=3
pkgdesc="A sans-serif typeface by Samsung, designed for Tizen."
arch=('any')
license=('APACHE')
url="https://developer.tizen.org/design/platform/styles/typography"
depends=('fontconfig')
source=("https://developer.tizen.org/sites/default/files/documentation/breeze_sans.zip")
install=ttf-breeze-sans.install
sha512sums=('71b71968a2d7fb97acd3337d296b155f78bd5b1248714bdb7b34f51f1be0bc709c4c1e863ed047b9395c1fc43f97b11d9b687e38b8ea257ab0ad587c0b370f3e')


package() {
  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 BreezeSans-Bold_${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -m644 BreezeSans-BoldCondensed_${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -m644 BreezeSans-Light_${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -m644 BreezeSans-LightCondensed_${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -m644 BreezeSans-Medium_${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -m644 BreezeSans-MediumCondensed_${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -m644 BreezeSans-Regular_${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -m644 BreezeSans-RegularCondensed_${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -m644 BreezeSans-Thin_${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -m644 BreezeSans-ThinCondensed_${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/"
}
