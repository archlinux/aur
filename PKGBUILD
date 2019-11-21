# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=python-inotify-simple
_name=inotify_simple
pkgver=1.2.0
pkgrel=0
pkgdesc="A simple wrapper around inotify."
license=("BSD")
url="https://pypi.python.org/pypi/inotify_simple"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/i/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f5a7dd817122f64196da8ba9b24ec285181215a9f7503791e718b3cb342eaee6')
arch=('any')
options=(!emptydirs)

package() {
  cd $srcdir/${_name}-$pkgver

  python setup.py install --root=$pkgdir
}
