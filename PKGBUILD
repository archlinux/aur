pkgname='python2-sqlite3dbm'
_module='sqlite3dbm'
pkgver='0.1.4'
pkgrel=1
pkgdesc="sqlite-backed dictionary"
url="http://github.com/Yelp/sqlite3dbm/"
depends=('python2')
makedepends=('python2-setuptools')
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/source/s/sqlite3dbm/sqlite3dbm-${pkgver}.tar.gz")
md5sums=('fc2f8fb09a4bbc0260b97e835b369184')

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
