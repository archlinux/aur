# Maintainer: Sebastien Leduc <sebastien@sleduc.fr

pkgname=python-sleekxmpp
pkgver=1.3.1
pkgrel=1
pkgdesc="A XMPP library written for Python 3.x"
arch=("any")
url="http://github.com/fritzy/SleekXMPP"
license=('MIT')
depends=('python')
optdepends=('python-dnspython: SRV support')
source=("https://pypi.python.org/packages/source/s/sleekxmpp/sleekxmpp-$pkgver.tar.gz")
md5sums=('ff7c1154fb238efa83ea64ef91a1bff4')

package() {
  cd "$srcdir/sleekxmpp-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
