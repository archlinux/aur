# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-pysswords
pkgver=0.0.12
pkgrel=1
pkgdesc="Pysswords manages encrypted login credentials in a local database"
arch=(any)
url="https://github.com/marcwebbie/pysswords"
depends=('python2' 'python2-colorama' 'python2-gnupg-patched' 'python2-tabulate' 'python2-pyperclip' 'python2-yaml')
source=("https://pypi.python.org/packages/source/p/pysswords/pysswords-$pkgver.tar.gz")


build() {
  cd "$srcdir/pysswords-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/pysswords-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('d7f714b9086594d2d14820fa4990d653')
