# Original Script for python2 version: Matmas <matmas@matmas.net>
# Contributor: Thomas Gubler <thomasgubler@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>

pkgname=python-websocket-client
pkgver=0.32.0
pkgrel=1
pkgdesc="WebSocket client library for Python"
arch=(any)
url="https://github.com/liris/websocket-client"
license=('LGPL')
depends=('python')
makedepends=('python' 'python-setuptools')
source=(http://pypi.python.org/packages/source/w/websocket-client/websocket_client-$pkgver.tar.gz)
md5sums=('b07a897511a3c585251fe2ea85a9d9d9')

package() {
  cd "$srcdir/websocket_client-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
