# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=otf-im-fell-types
pkgver=20121117
pkgrel=1
pkgdesc="A set of free modern revival fonts, with ligatures, swash characters, and ornaments, digitalized by Igino Marini."
arch=('any')
url="http://iginomarini.com/fell/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=(http://iginomarini.com/fell/wp-content/uploads/IMFellTypesClass.zip
        OFL.txt)
sha1sums=('dd228201eea5c24d15aa51ac058ae056a7315e20'
          '0fdc6a354c80cc47f8025d00c2baeafa019be7a5')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
