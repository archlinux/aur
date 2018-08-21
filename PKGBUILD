# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=python-inotify-simple
_name=inotify_simple
pkgver=1.1.8
pkgrel=1
pkgdesc="A simple wrapper around inotify."
license=("BSD")
url="https://pypi.python.org/pypi/inotify_simple"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/i/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('fc2c10dd73278a1027d0663f2db51240af5946390f363a154361406ebdddd8dd')
arch=('any')
options=(!emptydirs)

package() {
  cd $srcdir/${_name}-$pkgver

  python setup.py install --root=$pkgdir
}
