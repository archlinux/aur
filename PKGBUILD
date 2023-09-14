# Maintainer: Alberto Redondo <albertomost at gmail dot com>

pkgname=tala
pkgver=0.3.10
pkgrel=1
pkgdesc='A diagram layout engine designed specifically for software architecture diagrams'
arch=('x86_64')
url='https://github.com/terrastruct/TALA'
license=('custom')
depends=('d2')
source=("https://github.com/terrastruct/TALA/releases/download/v${pkgver}/tala-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('9e4caaffe505ef3573f655150ecbb329019e7bf956c27b09195ba56bd326c851')

package() {
  cd $pkgname-v$pkgver

  install -Dm755 bin/d2plugin-tala "$pkgdir/usr/bin/d2plugin-tala"

  install -Dm644 man/d2plugin-tala.1 "$pkgdir/usr/share/man/man1/d2plugin-tala.1"
  install -Dm644 man/tala.1 "$pkgdir/usr/share/man/man1/tala.1"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
