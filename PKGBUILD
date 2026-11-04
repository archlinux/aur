# Maintainer: Zack Bartel <zack@bartel.com>
pkgname=yoro-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="A yazi-inspired terminal UI for local calendars and contacts"
arch=('x86_64')
url="https://github.com/zackb/yoro"
license=('MIT')
depends=()
provides=('yoro')
conflicts=('yoro')
source=("https://github.com/zackb/yoro/releases/download/v$pkgver/yoro-$pkgver-linux-amd64.tar.gz")
# Updated by the release script when artifacts are published.
sha256sums=('0e6bb7e583fceb6d4cc24bffc4cb51c179900c5841c58d4de27b1d717e50cf66')

package() {
	install -Dm755 yoro "$pkgdir/usr/bin/yoro"
	install -Dm644 man/yoro.1 "$pkgdir/usr/share/man/man1/yoro.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
