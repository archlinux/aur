# Maintainer: Nissar Chababy <funilrys at outlook dot com>

pkgname=python-zerorpc
pkgver=0.6.1
pkgrel=2
pkgdesc="An easy to use, intuitive, and cross-language RPC"
arch=('any')
url="https://github.com/0rpc/zerorpc-python"
license=('MIT')
depends=('python3' 'python-distribute' 'python-setuptools' 'zeromq' 'python-msgpack' 'python-pyzmq' 'python-gevent' 'python-future')
source=("https://github.com/0rpc/zerorpc-python/archive/v${pkgver}.tar.gz")
sha512sums=('8efee348d9449b5ddcafa224dd068f9958a2331d5cfc1288fad98ed69e3600d893aa814bdb1b7441818b4627f54c723f1fef5b88d121fc19ed57720a8b9b92ca')

package() {
  cd "$srcdir/zerorpc-python-$pkgver"
  python3 setup.py install --root="${pkgdir}/"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
