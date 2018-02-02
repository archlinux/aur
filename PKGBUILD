# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-slackclient'
pkgver=1.1.2
pkgrel=1
pkgdesc="Python Slack client for the Web and RTM API"
arch=('x86_64')
url="https://pypi.python.org/pypi/slackclient"
license=('MIT')
depends=(
  'python'
  'python-websocket-client'
  'python-requests'
  'python-six'
)
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/08/6e/c84dcf7c18c0a79c17a3dec971bcfa746ea1e23d4f41ba1de7eead203266/slackclient-1.1.2.tar.gz")
sha256sums=('2e5840eba5af71487803b4eb8427ba19e1347fae6ed25cff53e0a6ea6c6832f5')

package() {
  cd "${srcdir}/slackclient-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
