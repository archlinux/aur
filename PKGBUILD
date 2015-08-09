# Maintainer: TDY <tdy@archlinux.info>

pkgname=ttf-monofur
pkgver=1.0
pkgrel=6
pkgdesc="A monospaced font derived from the eurofurence typeface family"
arch=('any')
url="http://www.dafont.com/monofur.font"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(monof_tt.zip::http://img.dafont.com/dl/?f=monofur)
sha256sums=('2d41ca991f342f9b74bc01433fba6c371fa7abcd5eaa45d8e71c9b8a2049055a')

package() {
  cd "$srcdir"
  install -Dm644 monof55.ttf "$pkgdir/usr/share/fonts/TTF/monof55.ttf"
  install -Dm644 monof56.ttf "$pkgdir/usr/share/fonts/TTF/monof56.ttf"
  install -Dm644 monof_tt.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:
