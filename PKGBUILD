# Maintainer: Azure <azure@fox.blue>
# Based on python-nbxmpp-git by:
# Contributor: Ondřej Hošek <ondra.hosek@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_gitrepo='python-nbxmpp'
pkgname='python-nbxmpp-2.0'
pkgver=2.0.6
pkgrel=1
pkgdesc="Nonblocking Jabber/XMPP library, used by Gajim 1.3.x"
arch=('any')
url="https://dev.gajim.org/gajim/python-nbxmpp"
license=('GPL3')
makedepends=('git')
depends=('python' 'python-precis_i18n' 'python-gobject' 'python-pyopenssl')
conflicts=('python-nbxmpp')
provides=('python-nbxmpp')
source=("git+https://dev.gajim.org/gajim/$_gitrepo.git#tag=nbxmpp-2.0.6")
sha384sums=('SKIP')

package() {
  cd "$srcdir/$_gitrepo"
  python setup.py install --root="$pkgdir/" --optimize=1
}
