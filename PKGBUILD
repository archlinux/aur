# Contributor: Lennart Regebro
# Maintainer: Fabien Devaux <fdev 31 at gmail dot com>

pkgname=hovercraft
pkgver=2.0
pkgrel=1
pkgdesc="A tool to make impress.js presentations from reStructuredText"
arch=(any)
url="https://github.com/regebro/hovercraft"
license=('CCPL')
depends=('python' 'python-lxml' 'python-docutils' 'python-svg.path' 'python-pygments' 'python-watchdog')

source=(http://pypi.python.org/packages/source/h/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('398d003c4bfaf3b8ce6e3fd8573819e6')

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build || exit 1
  python setup.py install --root="${pkgdir}" --optimize=1
}
