# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-cq-editor
pkgver=0.1RC1
pkgrel=1
pkgdesc="CadQuery GUI editor based on PyQT"
arch=('x86_64')
url="https://github.com/CadQuery/CQ-editor"
license=('Apache 2.0')
depends=('python-cadquery' 'python-pyqt5' 'python-qtconsole' 'python-logbook' 'python-pyparsing' 'python-pyqtgraph' 'python-path.py' 'python-requests' 'spyder')
makedepends=('python-setuptools')
source=("https://github.com/CadQuery/CQ-editor/archive/${pkgver}.tar.gz")
md5sums=('3e48fb0ead68ebffcaeef24a84999534')

package() {
  cd "${srcdir}/CQ-editor-${pkgver}"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
