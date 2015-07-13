# Maintainer: Sebastien Leduc <sebastien@sleduc.fr

pkgname=('python-sleekxmpp' 'python2-sleekxmpp')
pkgbase='python-sleekxmpp'
_realname='sleekxmpp'
pkgver=1.3.1
pkgrel=1
pkgdesc="A XMPP library written for Python 3.x"
arch=("any")
url="http://github.com/fritzy/SleekXMPP"
license=('MIT')
source=("https://pypi.python.org/packages/source/s/sleekxmpp/sleekxmpp-$pkgver.tar.gz")
md5sums=('ff7c1154fb238efa83ea64ef91a1bff4')

package_python-sleekxmpp() {
  depends=('python')
  optdepends=('python-dnspython: SRV support')
  cd "$srcdir/sleekxmpp-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-sleekxmpp() {
  depends=('python2')
  optdepends=('python2-dnspython: SRV support')
  cd "$srcdir/sleekxmpp-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
