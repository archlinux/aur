# Maintainer: Sebastien Leduc <sebastien@sleduc.fr

pkgname=('python-sleekxmpp' 'python2-sleekxmpp')
pkgbase='python-sleekxmpp'
_realname='sleekxmpp'
pkgver=1.3.2
pkgrel=1
pkgdesc="A XMPP library written for Python 3.x"
arch=("any")
url="http://github.com/fritzy/SleekXMPP"
license=('MIT')
source=("https://github.com/fritzy/SleekXMPP/archive/sleek-${pkgver}.tar.gz")
md5sums=('2f92d5d140de7de098af7e4aefa7ab5d')
makedepends=("python2" "python")

package_python-sleekxmpp() {
  depends=('python')
  optdepends=('python-dnspython: SRV support')
  cd "$srcdir/SleekXMPP-sleek-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-sleekxmpp() {
  depends=('python2')
  optdepends=('python2-dnspython: SRV support')
  cd "$srcdir/SleekXMPP-sleek-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
