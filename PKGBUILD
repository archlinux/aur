#Maintainer: Dylan Delgado <dylan1496 at live dot com>

_pkgname=executing
pkgname=python-executing
pkgver=0.5.4
pkgrel=1
pkgdesc="Get information about what a Python frame is currently doing, particularly the AST node being executed"
arch=('any')
url="https://github.com/alexmojaki/executing"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
source=("git+https://github.com/alexmojaki/executing.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${_pkgname}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}