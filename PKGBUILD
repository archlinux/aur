# Maintainer: takiz <tacidd@gmail.com>

pkgname=xkbl
pkgver=1.0
pkgrel=1
pkgdesc="Simple utility to get the current X keyboard layout"
arch=(any)
url="https://github.com/takiz/xkbl"
license=(GPL)
depends=(xorg-server)
makedepends=(make gcc libx11)
source=("https://github.com/takiz/xkbl/archive/$pkgver.tar.gz")
sha256sums=('07a6c9aef95b2962e9b7a236d530bcab54e19194a5fe6a59c3189bc7a6d910b7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xkbl/LICENSE"
}
