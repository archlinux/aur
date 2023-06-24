# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

_name=radio-canada
pkgbase=$_name-fonts
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable woff2-$_name)
pkgver=2.104
pkgrel=1
pkgdesc="The Radio-Canada typeface, from Canada's public broadcaster"
url="https://fonts.google.com/specimen/Radio+Canada"
arch=(any)
license=(custom:OFL)
_commit=e771e71ec5da5ce50306edcc15a4b29a237d23d6
source=("$pkgbase-$_commit.tar.gz::https://github.com/cbcrc/radiocanadafonts/archive/$_commit.zip")
b2sums=('785016235ab574326aaa9e0f817e37c13444a1a3a7050495cc0bef01539b799903630c1f04ad7b6cd7cdb6b3c718d66798d4434d91a4daa949eb262ef6e6fcbe')

package_otf-radio-canada() {
  cd radiocanadafonts-*/fonts
  install -Dt "$pkgdir"/usr/share/fonts/OTF -m644 otf/*.otf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ../OFL.txt
}

package_ttf-radio-canada() {
  cd radiocanadafonts-*/fonts
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 ttf/*.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ../OFL.txt
}

package_ttf-radio-canada-variable() {
  cd radiocanadafonts-*/fonts
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 variable/*.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ../OFL.txt
}

package_woff2-radio-canada() {
  cd radiocanadafonts-*/fonts
  install -Dt "$pkgdir"/usr/share/fonts/WOFF2 -m644 webfonts/*.woff2
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ../OFL.txt
}
