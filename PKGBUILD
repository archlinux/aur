# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=python-inotify-simple
_name=inotify_simple
pkgver=1.1.7
pkgrel=2
pkgdesc="A simple wrapper around inotify."
license=("BSD")
url="https://pypi.python.org/pypi/inotify_simple"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/i/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('076f74257b9e0d8ffa4f5f31f737ddd2')
arch=('any')
options=(!emptydirs)

package() {
  cd $srcdir/${_name}-$pkgver

  python setup.py install --root=$pkgdir
}
