# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

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

source=("https://pypi.python.org/packages/11/c1/519ef060fb62a089b9fda346d471a382a456ad23ccbe49885812d6cf45a9/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('4436fca90177886e7747ce0a2dc293c3a49d4152baead4784c8da80861085eaf')

# vim:set ts=2 sw=2 et:
