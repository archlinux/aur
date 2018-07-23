# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname=websockify
pkgver=0.8.0
pkgrel=2
pkgdesc="WebSocket to TCP proxy/bridge."
license=('LGPL3')
arch=('any')
url="http://github.com/kanaka/websockify"
makedepends=(python "python-distribute")
depends=(python "python-numpy")
source=("https://github.com/kanaka/$pkgname/archive/v${pkgver}.tar.gz")
sha1sums=('7efae9ab9fcf56d105f26038dc1f51ac9b6882a3')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set sw=2 sts=2 ft=sh et:
