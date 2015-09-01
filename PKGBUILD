# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=obquit
pkgver=0.2.2
pkgrel=1
pkgdesc="Simple logout script for Openbox"
arch=('any')
url="https://github.com/dglava/obquit"
license=('GPL3')
depends=('python' 'python-gobject' 'python-cairo' 'gtk3')
source=("https://github.com/dglava/$pkgname/archive/$pkgver.tar.gz")
md5sums=('b9617de5d9232fd39de9ecda18effac7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}
