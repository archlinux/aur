# Maintainer: morguldir <morguldir@protonmail.com>
# Contributor: MCMic <come@chilliet.eu>

pkgname=python-pyscroll
pkgver=2.19.2
pkgrel=1
pkgdesc="some basic modules to make scrolling pygame games"
arch=('any')
url="https://github.com/bitcraft/pyscroll"
license=(LGPL3)
depends=(python-pygame)
makedepends=(git python-setuptools)
source=("git://github.com/bitcraft/pyscroll.git#commit=b41c1016dfefd0e2d83a14a2ce40d7ad298c5b0f")
md5sums=(SKIP)
_gitname='pyscroll'

package() {
  cd ${srcdir}/${_gitname}
  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1
}
