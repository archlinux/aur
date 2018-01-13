# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-slackclient'
pkgver=1.1.0
pkgrel=1
pkgdesc="Python Slack client for the Web and RTM API"
arch=('x86_64')
url="https://pypi.python.org/pypi/slackclient"
license=('MIT')
depends=('python'
  'python-websocket-client>=0.35'
  'python-websocket-client<1.0a0'
  'python-requests>=2.11'
  'python-requests<3.0a0'
  'python-six>=1.10'
  'python-six<2.0a0')
conflicts=('python-slackclient')
provides=('python-slackclient')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/65/86/abb78f9c1c9eb8cde227e6cfee46921ec5e536a91a0ff2934922fddc56ec/slackclient-1.1.0.tar.gz")
md5sums=('a0138aa105392556dc497d5a335f0e7c')

package() {
  cd "${srcdir}/slackclient-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}