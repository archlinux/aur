# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>

_pkgname=python-pycpa
pkgname=$_pkgname-hg
pkgver=20150317
pkgrel=1
pkgdesc="Pragmatic Python implementation of Compositional Performance Analysis (aka the SymTA/S approach provided by Symtavision) used for research in worst-case timing analysis."
arch=('any')
makedepends=('mercurial')
depends=('python' 'python-matplotlib' 'python-pygraphviz' 'simpy' 'python-setuptools' 'python-nose' 'python-tornado')
provides=('pycpa')
url="https://bitbucket.org/pycpa/pycpa/"
license=('MIT')

source=("hg+https://bitbucket.org/pycpa/pycpa")
md5sums=("SKIP")

build() {
  cd ${srcdir}/pycpa
  python setup.py build
}

package() {
  cd ${srcdir}/pycpa
  python setup.py install --root="${pkgdir}"
}
