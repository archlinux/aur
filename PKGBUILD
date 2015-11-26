# Maintainer: Daniel Milde <daniel@milde.cz> 
pkgname=python-err
pkgver=3.2.1
pkgrel=1
pkgdesc="A plugin based chatbot designed to be easily deployable, extensible and maintainable."
arch=('any')
url="http://errbot.net"
license=('GPL')
depends=('python'
         'python-markdown'
         'python-ansi'
         'python-colorlog'
         'python-daemonize'
         'python-bottle'
         'python-pip'
         'python-jinja'
         'python-yapsy'
         'python-webtest')
makedepends=('python-setuptools')
optdepends=('python-sleekxmpp: XMPP backend'
            'python-pyasn1: XMPP backend'
            'python-pyasn1-modules: XMPP backend'
            'python-dnspython: XMPP backend'
            'python-tox-git: TOX backend'
            'python-irc: IRC backend')
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/e/errbot/errbot-$pkgver.tar.gz")
sha256sums=('4a45eebf36a8e50aaa88ff76876b14045306917340d274ab0a9c58f9d172c2fe')

package() {
  cd "$srcdir/errbot-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
