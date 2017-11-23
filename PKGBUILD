# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate-sql
pkgname=python-$_pkgname
pkgver=0.5.2
pkgrel=1
pkgdesc="Adds SQL read/write support to agate"
arch=('any')
url="http://agate-sql.readthedocs.org/"
license=('MIT')
depends=('python'
         'python-nose'
         'python-tox'
         'python-sphinx'
         'python-sphinx_rtd_theme'
         'python-wheel'
         'python-sqlalchemy'
         'python-agate')
source=("https://github.com/wireservice/agate-sql/archive/${pkgver}.tar.gz")
sha256sums=('cbf7caff7a7cda08e1d44497885ac248f30a35b9850c8710acf08326fb974b03')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
