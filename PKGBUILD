# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Matmas <matmas@matmas.net>
pkgname=python2-websocket-client-pebble
pkgver=0.11.0
pkgrel=2
pkgdesc="WebSocket client library for Python (v0.11 for Pebble)"
arch=(any)
url="https://github.com/liris/websocket-client"
license=('LGPL')
depends=('python2')
makedepends=('git' 'python2' 'python2-setuptools')
optdepends=()
provides=('python2-websocket-client')
conflicts=('python2-websocket-client')
source=("https://github.com/liris/websocket-client/archive/v${pkgver}.tar.gz")
sha1sums=('823744fde99e9e2dc7b9ff0390540e6cce499e43')

package() {
  cd "$srcdir/websocket-client-${pkgver}"
  python2 setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
