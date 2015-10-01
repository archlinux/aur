# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: stlarch  stlarchie@gmail.com

pkgname=stlarch_icons
pkgver=1.2
pkgrel=2
pkgdesc="8x8 .xbm icon pack for dzen or other status bars"
arch=('any')
url="http://sourceforge.net/projects/stlarchicons"
license=('GPL')
install=stlarch_icons.install
source=("http://sourceforge.net/projects/stlarchicons/files/$pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/icons/stlarch_icons"

  install -m755 * "$pkgdir/usr/share/icons/stlarch_icons"
}
md5sums=('436821df733ed9772ae8f7ae72a80ce4')
