# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-transitions-gui
pkgver=0.9.0
pkgrel=1
pkgdesc="A frontend for the state machine library transitions"
url="https://github.com/pytransitions/transitions-gui"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=('python-tornado' 'python-transitions')
source=("https://github.com/pytransitions/transitions-gui/archive/${pkgver}.tar.gz")
sha256sums=('01ab44157918cb2ee3b908429303841edc8284f67ede1bd72b0391faaa9b1439')

prepare() {
  cd "${srcdir}/transitions-gui-$pkgver"
}

build() {
  cd "${srcdir}/transitions-gui-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/transitions-gui-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


