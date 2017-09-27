# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=python2-ewmh
_gitname=pyewmh
pkgver=0.1.6
pkgrel=1
pkgdesc="A python implementation of EWMH (Extended Window Manager Hints)"
arch=('i686' 'x86_64')
url="https://github.com/parkouss/pyewmh/"
license=('LGPL')
depends=('python2-xlib')
makedepends=('git')
source=("https://github.com/parkouss/$_gitname/archive/v$pkgver.tar.gz")
md5sums=('9547049c458904e1083907c763e990d5')

package() {
  cd "$srcdir"/$_gitname-$pkgver
  python2 setup.py install --root "$pkgdir"

  install -Dm644 README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
