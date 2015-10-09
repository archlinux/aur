# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=python2-ordereddict
pkgver=1.1
pkgrel=1
pkgdesc="A drop-in substitute for Python 2.7's collections.OrderedDict that works in Python 2.4-2.6."
arch=(any)
url="http://pypi.python.org/pypi/ordereddict"
license=(APACHE)
depends=(python2)
makedepends=(python2-distribute)
changelog=Changelog
source=("http://pypi.python.org/packages/source/o/ordereddict/ordereddict-${pkgver}.tar.gz")
md5sums=('a0ed854ee442051b249bfad0f638bbec')

package() {
  cd "${srcdir}/ordereddict-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
