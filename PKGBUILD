
pkgname=ascii-live-client
pkgver=1.0
pkgrel=1
pkgdesc="C++ client for ascii.live animations"
arch=('x86_64')
url="https://github.com/FenchsApps/ascii-live-client"
license=('MIT')
depends=('curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FenchsApps/ascii-live-client/archive/v$pkgver.tar.gz")
sha256sums=('f579c9714c5e76a4e478a4c172c4e11a7c91842f922fa4ab9fb9fda5fd1a0d41')  # Замените на реальный хеш (см. инструкцию ниже)

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
