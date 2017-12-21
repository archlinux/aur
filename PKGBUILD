# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-tinytimer'
pkgver=0.0.0
pkgrel=1
pkgdesc="A tiny benchmarking library for Python"
arch=('any')
url="https://pypi.python.org/pypi/tinytimer"
license=('Apache-2.0')
depends=('python')
optdepends=()
makedepends=('python-pypandoc' 'python-setuptools')
ptions=(!emptydirs)
source=("https://pypi.python.org/packages/5c/87/75d3fbe15aabd45d9b70702241787cf1f7f30dd9fabcd9bc89d828c7661d/tinytimer-${pkgver}.tar.gz")
md5sums=('83d6988d1ca1702fcbd9ba5eae9d4fd7')

package() {
  cd "${srcdir}/tinytimer-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
