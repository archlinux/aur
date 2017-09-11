# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate-excel
pkgname=python-$_pkgname
pkgver=0.2.1
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

sha256sums=('2a850afe5576b5e2ffc8ea8115bcc45a6735e0b8df63c4ceeac33bbb9ed27de3')

# vim:set ts=2 sw=2 et:
