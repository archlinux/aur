# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=python-err
pkgver=2.2.1
pkgrel=3
pkgdesc="A plugin based chatbot designed to be easily deployable, extensible and maintainable."
arch=('any')
url="http://errbot.net"
license=('GPL')
depends=('python'
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
source=("https://pypi.python.org/packages/source/e/err/err-$pkgver.tar.gz")
sha256sums=('de6bcf6e310c9d20112b4379f905059db60c2ee5126678155a991b6acbd437a3')

package() {
  cd "$srcdir/err-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
