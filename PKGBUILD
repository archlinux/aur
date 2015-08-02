# Maintainer: David Bailey <david.bailey@archlinux.net>

pkgname=obquit
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple logout script for Openbox"
arch=('any')
url="https://github.com/dglava/obquit"
license=('GPL3')
depends=('python' 'python-gobject' 'python-cairo' 'gtk3')
source=("https://github.com/dglava/$pkgname/archive/$pkgver.tar.gz")
md5sums=('dd916c98d9f9b4f9849d64a518a6f7de')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}
