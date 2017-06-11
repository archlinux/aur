# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=python-inotify-simple
pkgver=1.1.1
pkgrel=1
_pypi_path=f4/2b/19e2723595f1187fd876f7d7f52e2ccd84143efdd74bf514b29866d836ac
pkgdesc="A simple wrapper around inotify."
license=("BSD")
url="https://pypi.python.org/pypi/inotify_simple"
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/${_pypi_path}/inotify_simple-${pkgver}.tar.gz")
md5sums=('c0138d5c6f87e72bbda8d2a6d1ef7357')
arch=('any')
options=(!emptydirs)

package() {
  cd $srcdir/inotify_simple-$pkgver

  python setup.py install --root=$pkgdir
}
