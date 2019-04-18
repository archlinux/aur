#Maintainer: Jason Preszler <jpreszler@gmail.com>, 4/16/2019
pkgname=python-tslearn
pkgver=0.1.29
pkgrel=1
pkgdesc="'tslearn' is a python package that provides machine learning tools for the analysis of time series."
arch=('x86_64')
url='https://github.com/rtavenar/tslearn'
license=('BSD')
groups=()
depends=('python' 'python-numpy' 'python-scipy' 'cython' 'python-scikit-learn')
optdepends=('python-tensorflow' 'python-keras-applications' 'python-keras-preprocessing')
makedepends=('python-setuptools' 'cython>=0.17')
options=(!emptydirs)
source=("git+https://github.com/rtavenar/tslearn.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/tslearn"
  python setup.py install --root="$pkgdir/" --optimize=1
}
