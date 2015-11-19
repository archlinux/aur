# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

_py=python2

pkgname=websockify
pkgver=0.7.0
pkgrel=1
pkgdesc="WebSocket to TCP proxy/bridge."
license=('LGPL3')
arch=('any')
url="http://github.com/kanaka/websockify"
makedepends=($_py "$_py-distribute")
depends=($_py "$_py-numpy")
source=("https://github.com/kanaka/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('396a39001aeb0b4a1b2591f9715e1dbb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  $_py setup.py install --root="$pkgdir/" --optimize=1
}
