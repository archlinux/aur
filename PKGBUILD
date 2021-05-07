# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pypiname=isit
pkgbase=python-isit
pkgname=python-isit
pkgver=0.3.6
pkgrel=2
pkgdesc="Python library for discovering environment information (OS, Distribution, Python version)"
arch=('any')
url="https://pypi.python.org/pypi/isit/"
license=('AGPLv3')
depends=('python')
source=(https://pypi.io/packages/source/i/$pypiname/$pypiname-$pkgver.tar.gz)
md5sums=('cee801e13e06ce02463a66d5b8076bee')


build() {
  cd $pypiname-$pkgver
  python setup.py build
}

package() {
  cd $pypiname-$pkgver
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
