# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate-sql
pkgname=python-$_pkgname
pkgver=0.5.3
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
sha256sums=('73f7ed13092a0ec18f94820290e5c372cfeea256daef53300ae168965d40a37a')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
