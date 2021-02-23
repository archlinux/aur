# Maintainer: Andreas Tennert <mail at andreas-tennert dot de>
pkgname='lcarsde-application-starter'
pkgver=21.1
pkgrel=1
pkgdesc="Menu for lcarsde to display and run installed software"
arch=('any')
url="https://lcarsde.github.io"
license=('MIT')
groups=('lcarsde')
depends=('python>=3.8' 'python-gobject' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lcarsde/application-starter/archive/$pkgver.tar.gz")
md5sums=('8bf81ba032599ffdd1a05a520fbecdd7')

package() {
  cd "application-starter-$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  cp src/lcarsde-application-starter.py "$pkgdir/usr/bin/"
  cp -r resources/* "$pkgdir/"
}
