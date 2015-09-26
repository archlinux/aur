# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=python-err
pkgver=3.0.4
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
source=("https://pypi.python.org/packages/source/e/err/err-$pkgver.tar.gz")
sha256sums=('658321641ec1f1b57ab53eafc64d78dfe804f56ae0a111f8eb18d6cf64702eea')

package() {
  cd "$srcdir/err-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
