# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-pygerrit2
pkgver=2.0.9
pkgrel=1
pkgdesc="Python library to interface with Gerrit's REST API "
arch=('any')
license=('MIT')
url="https://github.com/dpursehouse/pygerrit2"
depends=('python-setuptools' 'python-pbr' 'python-requests')
source=("https://pypi.io/packages/source/p/pygerrit2/pygerrit2-$pkgver.tar.gz")
sha512sums=('043aa7659b6ff8321e733a4a7e48f75fe262970df8e8eb34f19307fc19a40c3ae6515f1ecfa958f777f48e66ecf04cbddff7441539a785803d80bf23b5338dde')

build() {
  cd pygerrit2-$pkgver
  python setup.py build
}

package() {
  cd pygerrit2-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

