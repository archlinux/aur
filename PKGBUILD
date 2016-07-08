# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=agate-excel
pkgname=python-$_pkgname
pkgver=0.1.0
pkgrel=1
pkgdesc="Adds read support for Excel files (xls and xlsx) to agate"
arch=('any')
url="http://agate-excel.readthedocs.org/"
license=('MIT')
depends=('python'
         'python-nose'
         'python-tox'
         'python-sphinx'
         'python-sphinx_rtd_theme'
         'python-wheel'
         'python-xlrd'
         'python-openpyxl'
         'python-agate')

source=("https://pypi.python.org/packages/25/39/71dfd88cf42ee2944c4aa8d94e4a3e2404abe45b97c85bf5a6224bfa6306/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('5341b08ffa6882b5b558d97b431ff122cd4c178fd5fb884a831f71ccef90fb23')

# vim:set ts=2 sw=2 et:
