# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate
pkgname=python-$_pkgname
pkgver=1.4.0
pkgrel=1
pkgdesc="A data analysis library that is optimized for humans instead of machines"
arch=('any')
url="http://agate.readthedocs.org/"
license=('MIT')
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
         'python-awesome-slugify')

source=("https://github.com/wireservice/agate/archive/${pkgver}.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('fadcc8c2713212e49a36eb4498d71d6538875e8e1aa5a9813a8e1b35d100e92f')

# vim:set ts=2 sw=2 et:
