# Maintainer: Nils Amiet <amietn@foobar>
pkgname=python-pyhocon
pkgver=0.3.48
pkgrel=1
pkgdesc="HOCON parser for Python"
arch=(any)
url="https://github.com/chimpler/pyhocon"
license=('Apache License 2.0')
groups=()
depends=(python python-pyparsing)
makedepends=(git)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${pkgname}::git+https://github.com/chimpler/pyhocon.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
