# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=obquit
pkgver=0.2.1
pkgrel=2
pkgdesc="Simple logout script for Openbox"
arch=('any')
url="https://github.com/dglava/obquit"
license=('GPL3')
depends=('python' 'python-gobject' 'python-cairo' 'gtk3')
source=("https://github.com/dglava/$pkgname/archive/$pkgver.tar.gz")
md5sums=('dccc30756688e3791a1d1a0dcc094987')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}
