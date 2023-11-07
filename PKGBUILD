# Maintainer: Ali Hassan >>Alix35301@gmail.com<<

pkgname=dhivehi_fonts
pkgver=2.0
pkgrel=1
pkgdesc="Dhivehi fonts for arch ttf, otf"
url="https://https://github.com/Alix35301"
arch=(any)
license=(custom)
_tarname=Dhivehi_fonts
source=("$_tarname.tar.xz::https://github.com/Alix35301/dhivehi_fonts/raw/master/Dhivehi_fonts.tar.xz")
md5sums=('873fce3ced364e45978f9937a61fa5d2')
package() {
  cd $_tarname
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 OTF/*.otf
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
