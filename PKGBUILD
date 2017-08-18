# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='jpterm'
pkgname=("python-${pkgbase}" "python2-${pkgbase}")
pkgver="0.2.1"
pkgrel='1'
pkgdesc='JMESPath Terminal.'
arch=('any')
url="https://github.com/jmespath/jmespath.terminal"
makedepends=('python-setuptools' 'python2-setuptools')
license=('ASL 2.0')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('811d87d408ea4d3ab63a88226e09fd0b55a33b07ec7c1ef1434e8f7a647510b9')

package_python-jpterm() {
  depends=('python-jmespath' 'python-pygments' 'python-urwid')

  cd "${srcdir}/jmespath.terminal-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-jpterm() {
  depends=('python2-jmespath' 'python2-pygments' 'python2-urwid')

  cd "${srcdir}/jmespath.terminal-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
}
