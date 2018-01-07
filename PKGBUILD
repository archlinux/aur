Maintainer='Gilles Hamel <hamelg@laposte.net>'
pkgname=python2-txamqp
pkgver=0.8.0
pkgrel=1
pkgdesc='Python library for communicating with AMQP peers and brokers using Twisted'
arch=('any')
url='https://github.com/txamqp/txamqp'
license=('Apache')
depends=('python2' 'python2-twisted')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::"https://github.com/txamqp/txamqp/archive/${pkgver}.tar.gz")
md5sums=('be2cd00a69d158d5721b14e3ce3af3e0')

package() {
  cd "$srcdir/txamqp-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
