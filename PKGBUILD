# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-eurof
pkgver=1.0
pkgrel=1
pkgdesc="The original eurofurence font designed for headlines, signs, badges, inscriptions, et al."
arch=('any')
url="http://www.eurofurence.net/eurofurence.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.eurofurence.net/eurof_tt.zip)
md5sums=('19a13896e288a82a3e4eba1df21918f3')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 eurof*.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 eurof_tt.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
