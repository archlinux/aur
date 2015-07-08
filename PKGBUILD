# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor:  foalsrock <foalsrock at gmail dot com>

pkgname=otf-aurulent-sans
pkgver=20121130
pkgrel=1
pkgdesc="Aurulent Sans is designed to be used as an interface font on free graphics servers such as X.org."
arch=('any')
url="http://www.dafont.com/aurulent-sans.font"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=("$pkgname-$pkgver.zip::http://img.dafont.com/dl/?f=aurulent_sans"
        "OFL.txt")
sha1sums=('d22a292f5aa66708cceb2ead2f341a88859d40cd'
          'e4575441fb9b826e243d7a76622686d7923835cb')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
