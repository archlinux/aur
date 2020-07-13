# Maintainer: morguldir <morguldir@protonmail.com>
# Contributor: MCMic <come@chilliet.eu>

pkgname=python-pyscroll
pkgver=2.19.3
pkgrel=1
pkgdesc="A generic module for making a fast scrolling image with pygame."
arch=('any')
url="https://github.com/bitcraft/pyscroll"
license=(LGPL3)
depends=(python-pygame)
makedepends=(git python-setuptools)
source=("git+https://github.com/bitcraft/pyscroll.git#commit=65a58a7fbe055a5e61dfa518b96fbc2fe8f907a5")
md5sums=(SKIP)

package() {
  cd ${srcdir}/pyscroll
  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1
}
