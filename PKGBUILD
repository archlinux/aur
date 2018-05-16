pkgname=python-fmpy
pkgver=0.2.3
pkgrel=1
pkgdesc="Simulate Functional Mockup Units (FMUs) in Python"
url="https://github.com/CATIA-Systems/FMPy"
arch=(any)
license=('BSD')
makedepends=('python-setuptools')
source=("https://github.com/CATIA-Systems/FMPy/archive/v${pkgver}.tar.gz")
md5sums=('628ff9439b7e14f2644e0caefd7b8dd3')

build() {
  cd "${srcdir}"/FMPy-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/FMPy-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
