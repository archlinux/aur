# Maintainer: Zack Bartel <zack@bartel.com>
pkgname=yoro-bin
pkgver=0.3.2
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
sha256sums=('3bb6d273d12438e7c6a3f7d3963786abac64a1411a507315e7a4a7bed7d887d8')

package() {
	install -Dm755 yoro "$pkgdir/usr/bin/yoro"
	install -Dm644 man/yoro.1 "$pkgdir/usr/share/man/man1/yoro.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
