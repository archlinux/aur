# Original Script for python2 version: Matmas <matmas@matmas.net>
# Contributor: Thomas Gubler <thomasgubler@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>

pkgname=python-websocket-client
pkgver=0.12.0
pkgrel=1
pkgdesc="WebSocket client library for Python"
arch=(any)
url="https://github.com/liris/websocket-client"
license=('LGPL')
depends=('python')
makedepends=('git' 'python' 'python-setuptools')
optdepends=()
provides=('python-websocket-client')
conflicts=('python-websocket-client')
options=(!emptydirs)
source=(https://github.com/liris/websocket-client/archive/v$pkgver-py3.zip)
md5sums=('63c7d2157cbad1f68e1f3de90969f0d6')

package() {
  cd "$srcdir/websocket-client-$pkgver-py3"
  python setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 ft=sh et:
