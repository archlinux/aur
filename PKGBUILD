# Author: Patrick Brisbin <pbrisbin@gmail.com>
pkgname=ghu
pkgver=0.0.5
pkgrel=1
pkgdesc="Unsubscribe from GitHub emails via their List-Unsubscribe header"
arch=('any')
url="https://github.com/pbrisbin/$pkgname"
license=('MIT')
depends=(curl)
source=("https://github.com/pbrisbin/$pkgname/archive/v$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('366ede7ec3a2edebf127210f2b3bad7d')
