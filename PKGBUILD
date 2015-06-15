# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

_py=python2

pkgname=websockify
pkgver=0.6.1
pkgrel=1
pkgdesc="WebSocket to TCP proxy/bridge."
license=('LGPL3')
arch=('any')
url="http://github.com/kanaka/websockify"
makedepends=($_py "$_py-distribute")
depends=($_py "$_py-numpy")
source=("https://github.com/kanaka/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('e11c9b1404b84564e4c401c1ed78e264')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  $_py setup.py install --root="$pkgdir/" --optimize=1
}
