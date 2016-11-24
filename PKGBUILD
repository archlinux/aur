# Maintainer: Marco Scopesi <marco.scopesi@gmail.com>
pkgname=pydocstyle
pkgver=1.1.1
pkgrel=1
pkgdesc="PEP 257 docstring style checker."
arch=(any)
url="https://github.com/PyCQA/pydocstyle"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/PyCQA/pydocstyle/archive/${pkgver}.tar.gz")
sha1sums=('71236b3a8d7e2639617b9ba8e00327334ed45085')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
}
