# Maintainer: Andreas Tennert <mail at andreas-tennert dot de>
pkgname='lcarsde-app-menu'
pkgver=23.1
pkgrel=1
pkgdesc="lcarsde menu for showing, selecting and closing windows"
arch=('any')
url="https://lcarsde.github.io"
license=('MIT')
groups=('lcarsde')
depends=('python>=3.8' 'python-gobject' 'gtk3' 'python-posix_ipc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lcarsde/menu/archive/$pkgver.tar.gz")
md5sums=('02ad3edc4d3ede76bd8936e55f0d36ed')

package() {
  cd "menu-$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  cp src/lcarsde-app-menu.py "$pkgdir/usr/bin/"
  cp -r resources/etc "$pkgdir/etc"
}
