# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate-excel
pkgname=python-$_pkgname
pkgver=0.2.2
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

source=("https://github.com/wireservice/agate-excel/archive/${pkgver}.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('37acbc114c4c60aa37f908d93a9e9b597c3ba0ee42672f36f7a317f8af8fc581')

# vim:set ts=2 sw=2 et:
