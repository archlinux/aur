# Maintainer: Ali Hassan >>Alix35301@gmail.com<<

pkgname=dhivehi_fonts
pkgver=2.6
pkgrel=1
pkgdesc="Dhivehi fonts for arch ttf, otf"
url="https://https://github.com/Alix35301"
arch=(any)
license=(custom)
_tarname=Dhivehi_fonts
source=("$_tarname.tar.xz::https://github.com/Alix35301/dhivehi_fonts/raw/master/Dhivehi_fonts.tar.xz")
package() {
  cd $_tarname
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 OTF/*.otf
}

# vim:set ts=2 sw=2 et:
sha256sums=('6ebc94b324a21c154f20ce544f1f03adc3680e10995225b7579ddb9bd539dbda')
