# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-pygerrit2
pkgver=2.0.15
pkgrel=1
pkgdesc="Python library to interface with Gerrit's REST API "
arch=('any')
license=('MIT')
url="https://github.com/dpursehouse/pygerrit2"
depends=('python-setuptools' 'python-pbr' 'python-requests')
source=("https://pypi.io/packages/source/p/pygerrit2/pygerrit2-$pkgver.tar.gz")
sha512sums=('1fa705d44cbdf2fb3adc8db70abf988ac80aefbc8949767a311c5e63afa6da022c29e650b9428873b587134d944eea2a3d46c85cde2dbd2ef8c22724079cdd58')

build() {
  cd pygerrit2-$pkgver
  python setup.py build
}

package() {
  cd pygerrit2-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

