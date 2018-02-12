# Maintainer: Edwin Peters <slimed13 at hotmail dot com>


pkgname=python-scikit-cuda-git
pkgver=57213a9
pkgrel=1
pkgdesc="Python interface to GPU-powered libraries"
arch=('any')
url="http://scikit-cuda.readthedocs.org/"
license=('BSD')
depends=('python' 'python-numpy' 'cuda' 'python-pycuda' 'python-mako' 'python-pytest')
optdepends=('python-scipy' 'python-sphinx' 'python-sphinx_rtd_theme')
makedepends=('python-setuptools' 'git')
source=(git+https://github.com/lebedov/scikit-cuda.git)
sha256sums=(SKIP)

package() {
  cd ${srcdir}/scikit-cuda

  # ignores any LDFLAGS set in makepkg.conf
  unset LDFLAGS

  python ./setup.py install --root=${pkgdir}

}

