# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=python-inotify-simple
pkgver=1.0.4
pkgrel=2
pkgdesc="A simple wrapper around inotify."
license=("BSD")
url="https://pypi.python.org/pypi/inotify_simple"
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/b4/1b/dadbc238a3c4637cd57dbce2437ca1ad444127a489f38e2f619d3356785d/inotify_simple-${pkgver}.tar.gz")
md5sums=('c0d2dbf007551bf3a3e081b869f1b7e0')
arch=('any')
options=(!emptydirs)

package() {
  cd $srcdir/inotify_simple-$pkgver

  python setup.py install --root=$pkgdir
}
