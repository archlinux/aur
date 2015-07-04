# Maintainer: Michael Düll <mail@akurei.me> PGP-Key: AAAEE882

pkgname=ttf-lcsmith-typewriter
pkgver=20120906
pkgrel=2
pkgdesc='L. C. Smith Typewriter font.'
arch=('any')
license=('custom:free_for_non_commercial_use')
url="http://www.typewriters.ch/collection/l_c_smith_no5.html"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('wget' 'unzip')
install=$pkgname.install
source=(
  "http://www.typewriters.ch/fonts/L.C.%20Smith%20typewriter%20font.zip"
)

package()
{
  cd "$srcdir/"
  unzip -qo L.C.%20Smith%20typewriter%20font.zip
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -m644 $srcdir/info.txt $pkgdir/usr/share/licenses/$pkgname/
}

sha512sums=('e23a4b3afdc23127fb2ebdd6af6d9c40bdc5692dd02ffe8bb4dbefec7326a8e8c7b1a28d84f2739c61cc82e32b43810bee4a85fa3f7fb724a311884e6a35953b')
