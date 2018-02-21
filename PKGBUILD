# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Martin Florén <martin.floren@gmail.com>

pkgname=otf-raleway
_fontname=raleway
pkgver=1
pkgrel=3
pkgdesc='A sans-serif display typeface designed in a single thin weight'
arch=('any')
url='http://theleagueofmoveabletype.com/raleway'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/theleagueof/${_fontname}/archive/master.zip")
sha256sums=('f6ed3c96644d9f01f6dbe10c427b830811c0faf13127a776567ad8f9036c67d0')

package() {
  cd ${_fontname}-master
  install -Dm644 'Open Font License.markdown' $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 'Raleway Thin.otf' $pkgdir/usr/share/fonts/OTF/Raleway_Thin.otf
}
