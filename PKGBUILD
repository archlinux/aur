# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate
pkgname=python-$_pkgname
pkgver=1.6.1
pkgrel=1
pkgdesc="A data analysis library that is optimized for humans instead of machines"
arch=('any')
url="http://agate.readthedocs.org/"
license=('MIT')
# According to requirements-py3.txt
depends=('python'
         'python-nose'
         'python-tox'
         'python-sphinx'
         'python-coverage'
         'python-six'
         'python-sphinx_rtd_theme'
         'python-wheel'
         'python-pytimeparse'
         'python-babel'
         'python-parsedatetime'
         'python-pytz'
         'python-isodate'
         'python-slugify'
         'python-lxml'
         'python-cssselect'
         'python-leather')

source=("https://github.com/wireservice/agate/archive/${pkgver}.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('0397d3dcc6ae78b8289294b3bca15b2a7328b9015aed8841bc650700fe2a6cad')

# vim:set ts=2 sw=2 et:
