# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=python2-zerorpc
pkgver=0.4.4
pkgrel=1
pkgdesc="A flexible RPC implementation based on zeromq and messagepack."
arch=('any')
url="http://zerorpc.dotcloud.com"
license=('MIT')
depends=('python2>=2.7' 'python2-distribute' 'zeromq>=2.2.0' 'python2-msgpack' 'python2-pyzmq>=2.2.0.1' 'python2-gevent')
options=(!emptydirs)
source=("https://github.com/dotcloud/zerorpc-python/archive/v${pkgver}.tar.gz")
md5sums=('1f1decbb60cc8cd376d7a964ff0d0039')

package() {
  cd "$srcdir/zerorpc-python-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
