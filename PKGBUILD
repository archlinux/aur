# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-jsonpath-rw
pkgver=1.4.0
pkgrel=1
pkgdesc="A robust and significantly extended implementation of JSONPath for Python."
arch=('any')
url='https://github.com/kennknowles/python-jsonpath-rw'
license=('Apache')
makedepends=('python-setuptools')
checkdepends=('python')
depends=('python')
source=("https://github.com/kennknowles/python-jsonpath-rw/archive/${pkgver}.tar.gz")
sha256sums=('0aac3458f78b115e661a51610b631c46f27c8b6a4446e4dafb9a13b5ddb5d5e7')

check() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
