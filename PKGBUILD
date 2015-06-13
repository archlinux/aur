# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=python-cs1graphics
pkgver=1.2
pkgrel=2
pkgdesc="Simple python2/python3 graphics library."
arch=('any')
url="http://www.cs1graphics.org/"
license=('GPL3')
depends=('tk')
optdepends=('python: for python3 support'
            'python2: for python2 support')
source=(http://www.cs1graphics.org/download/v$pkgver/$pkgname.py)
md5sums=('2abf99242b7fd77990ad5a80afad6ac1')

package() {
  cd "$srcdir"
  # link together instead?  use a real python setup?
  install -Dm644 cs1graphics.py "$pkgdir/usr/lib/python2.7/site-packages/$pkgname/__init__.py"
  install -Dm644 cs1graphics.py "$pkgdir/usr/lib/python3.2/site-packages/$pkgname/__init__.py"
}
