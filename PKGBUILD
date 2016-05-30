# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ttf-perfectdos
pkgver=1
pkgrel=2
pkgdesc='Fonts similar to what BIOS/DOS looks like'
arch=('any')
license=('custom:free')
url='http://www.dafont.com/perfect-dos-vga-437.font'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
sha256sums=('cf5c22a3094e5452e473a912086d2c81d014b3e762235218a958b289757a7d5d')
source=('perfectdos.zip::http://img.dafont.com/dl/?f=perfect_dos_vga_437')

package() {
  cd "$srcdir"
  install -Dm644 'Perfect DOS VGA 437.ttf'      "$pkgdir/usr/share/fonts/TTF/Perfect DOS VGA 437.ttf"
  install -Dm644 'Perfect DOS VGA 437 Win.ttf'  "$pkgdir/usr/share/fonts/TTF/Perfect DOS VGA 437 Win.ttf"
}
