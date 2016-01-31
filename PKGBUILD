Maintainer='Gilles Hamel <hamelg@laposte.net>'
pkgname=python2-txamqp
pkgver=0.6.2
pkgrel=1
pkgdesc='Python library for communicating with AMQP peers and brokers using Twisted'
arch=('any')
url='https://launchpad.net/txamqp'
license=('Apache')
groups=()
depends=('python2' 'twisted')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=('https://pypi.python.org/packages/source/t/txAMQP/txAMQP-0.6.2.tar.gz')
md5sums=('8c3e9c42d60d06b088d91ed9ba159e13')

package() {
  cd "$srcdir/txAMQP-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et: