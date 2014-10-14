# Original Script for python2 version: Matmas <matmas@matmas.net>
# Contributor: Thomas Gubler <thomasgubler@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>

pkgname=python-websocket-client
pkgver=0.20.0
pkgrel=1
pkgdesc="WebSocket client library for Python"
arch=(any)
url="https://github.com/liris/websocket-client"
license=('LGPL')
depends=('python')
makedepends=('python' 'python-setuptools')
source=(http://pypi.python.org/packages/source/w/websocket-client/websocket-client-$pkgver.tar.gz)
sha512sums=('74a970cf8391b70a61e07887d86eadf3c85a44d6e6877975a7135992e878ff56a1110eef63ea9a4f4b3513cfad109c954c4bcd77c68f741bffd569367f10cfe9')

package() {
  cd "$srcdir/websocket-client-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
