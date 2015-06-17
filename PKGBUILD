# Maintainer: Masoud <mpoloton@gmail.com>

pkgname=('python-nibabel')
pkgver=2.0.0
pkgrel=1
pkgdesc="Python library for reading and writing of some common neuroimaging file formats"
arch=('i686' 'x86_64')
url="http://nipy.org/nibabel"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/n/nibabel/nibabel-${pkgver}.tar.gz")
md5sums=('befa2fcbd242496a83007a47aad538de')


build() {
  msg "Building Python3"
  cd "$srcdir"/nibabel-${pkgver}
  python setup.py build
}


package_python-nibabel() {

  cd "$srcdir"/nibabel-${pkgver}

  python setup.py install --skip-build --root="$pkgdir" --optimize=1

}

