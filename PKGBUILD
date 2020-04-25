pkgname=python-fmpy
pkgver=0.2.19
pkgrel=1
pkgdesc="Simulate Functional Mockup Units (FMUs) in Python"
url="https://github.com/CATIA-Systems/FMPy"
arch=(any)
license=('BSD')
makedepends=('python-setuptools')
source=("https://github.com/CATIA-Systems/FMPy/archive/v${pkgver}.tar.gz")
md5sums=('cf07d9da29f1e1ae29e6dff84534362c')

build() {
  cd "${srcdir}"/FMPy-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/FMPy-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
