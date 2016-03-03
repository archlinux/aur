# Maintainer: Daniel Milde <daniel@milde.cz> 
pkgname=python-err
pkgver=3.2.3
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
sha256sums=('bed7c6bd2a00e2cb679559f30839065e5f56b92fc67acc17dd684b0501e21934')

package() {
  cd "$srcdir/errbot-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
