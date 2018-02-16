# Contributor:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Martin Florén <martin.floren@gmail.com>

pkgname=otf-raleway
pkgver=1
pkgrel=2
pkgdesc="A sans-serif typeface"
arch=('any')
url="http://theleagueofmoveabletype.com/raleway/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
source=('https://github.com/theleagueof/raleway/archive/master.zip')
sha256sums=('f6ed3c96644d9f01f6dbe10c427b830811c0faf13127a776567ad8f9036c67d0')

package() {
  cd "$srcdir/raleway-master"
  install -Dm644 "Raleway Thin.otf" "$pkgdir/usr/share/fonts/OTF/Raleway Thin.otf"
  install -Dm644 "Open Font License.markdown" "$pkgdir/usr/share/licenses/$pkgname/Open Font License.markdown"
  install -m644 "Open Font License FAQ.markdown" "$pkgdir/usr/share/licenses/$pkgname/Open Font License FAQ.markdown"
}
