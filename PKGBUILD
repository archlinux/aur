# Maintainer: malwareslayer <alternate-egoist@protonmail.com>

pkgname=mbuild
_pypiname=mbuild

pkgver=0.1
pkgrel=0
pkgdesc="mbuild is a python-based build system very similar to scons with some philosophical features of make. mbuild exposes the scan and build phases allowing them to be repeated as necessary. Multiple DAGs can be built, one during each scan phase."

url="https://intelxed.github.io/"
license=("Apache License v.2")

arch=("any")
depends=('python')
makedepends=('python-setuptools')

source=('git+https://github.com/intelxed/mbuild')
sha256sums=('SKIP')

package() {
  cd ${_pypiname}
  python setup.py install --optimize=1 --root="${pkgdir}" --prefix=/usr
}
