# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-html
pkgver=1.16
pkgrel=1
pkgdesc="Simple, elegant HTML, XHTML and XML generation"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://pypi.python.org/pypi/html"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/h/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('39b9db7cdcc84607828be021172d441f')
sha256sums=('ebc768f23b54a71350d731a75f2ef3a4a4dbdad9ae68d58b527664b66088e456')

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
