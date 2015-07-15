# Contributor: Lennart Regebro
# Maintainer: Fabien Devaux <fdev 31 at gmail dot com>

pkgname=hovercraft
pkgver=2.0b1
pkgrel=3
pkgdesc="A tool to make impress.js presentations from reStructuredText"
arch=(any)
url="https://github.com/regebro/hovercraft"
license=('CCPL')
depends=('python' 'python-lxml' 'python-docutils' 'python-svg.path' 'python-pygments' 'python-watchdog')

source=(http://pypi.python.org/packages/source/h/${pkgname}/${pkgname}-${pkgver}.zip)
md5sums=('990d733d3e4f34ea20e445f6b42c179b')

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build || exit 1
  python setup.py install --root="${pkgdir}" --optimize=1
}
