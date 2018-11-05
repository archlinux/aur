# Maintainer: Jeremiah Menétrey <superjun1 at gmail dot com>
# Contributor: Carlos Pita <carlosjosepita at gmail dot com>

pkgname=maximal
pkgver=20181105
pkgrel=1
pkgdesc='Hides the titlebar when a window is maximized in Gnome/Cinnamon'
arch=('any')
url='https://github.com/crazygolem/maximal'
license=('custom:unlicense')
depends=('python-xlib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crazygolem/maximal/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D maximal $pkgdir/usr/bin/maximal
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
