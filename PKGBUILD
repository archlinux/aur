# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=python-inotify-simple
pkgver=1.1.7
pkgrel=1
_pypi_path=3b/72/163c1d2eaf7d7c825f4442d0c8c6469fd77bcbb951dacd09526b54ad8931
pkgdesc="A simple wrapper around inotify."
license=("BSD")
url="https://pypi.python.org/pypi/inotify_simple"
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/${_pypi_path}/inotify_simple-${pkgver}.tar.gz")
md5sums=('076f74257b9e0d8ffa4f5f31f737ddd2')
arch=('any')
options=(!emptydirs)

package() {
  cd $srcdir/inotify_simple-$pkgver

  python setup.py install --root=$pkgdir
}
