# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-ewmh
_gitname=pyewmh
pkgver=0.1.3
pkgrel=1
pkgdesc="A python implementation of EWMH (Extended Window Manager Hints)"
arch=('i686' 'x86_64')
url="https://github.com/parkouss/pyewmh/"
license=('LGPL')
depends=('python-xlib')
makedepends=('git')
source=("https://github.com/parkouss/$_gitname/archive/v$pkgver.tar.gz")
md5sums=('7437f0a48121fa53e6780f96cf11dca0')

package() {
  cd "$srcdir"/$_gitname-$pkgver
  python setup.py install --root "$pkgdir"

  install -Dm644 README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
