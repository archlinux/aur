# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: wido <widomaker2k7@gmail.com>

pkgname=tint2-themes
pkgver=0.10
pkgrel=1
pkgdesc="Config files from the web for tint2."
arch=('any')
url="http://tint2.googlecode.com"
license=('GPL')
depends=('tint2')
source=(http://tint2.googlecode.com/files/tint2-$pkgver-theme.tar.gz)
sha1sums=('e80c5bc2e40fade2175365ae935f4f08bc022d1c')

package() {
  cd "$srcdir/tint2-$pkgver-theme"
  install -d "$pkgdir/usr/share/tint2/themes"
  install -m644 *.tint2rc "$pkgdir/usr/share/tint2/themes/"
}
# vim:set ts=2 sw=2 et:
