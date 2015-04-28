# Original Script for python2 version: Matmas <matmas@matmas.net>
# Contributor: Thomas Gubler <thomasgubler@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>

pkgname=python-websocket-client
pkgver=0.30.0
pkgrel=2
pkgdesc="WebSocket client library for Python"
arch=(any)
url="https://github.com/liris/websocket-client"
license=('LGPL')
depends=('python')
makedepends=('python' 'python-setuptools')
source=(http://pypi.python.org/packages/source/w/websocket-client/websocket_client-$pkgver.tar.gz)
sha512sums=('e131d84c1b2e477f47baf0fdf0a6dc21f0ea56f6e629a0febd56c6de06ff232d306c2d93a9f824ce84f44827e5cc56c6146dc0c1ceea3a8a63af1e1adae9b17c')

package() {
  cd "$srcdir/websocket_client-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
