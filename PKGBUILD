pkgname=rift-clipboard-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Lightweight multi-format clipboard manager for Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpuncher/rift'
license=('MIT')
depends=('glibc' 'libgcc')
provides=('rift')
conflicts=('rift' 'rift-bin')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/rift-linux-x64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/rift-linux-arm64.tar.gz")
sha256sums_x86_64=('b3072a47b129cee51ddb39c98d5b0f66825334e4a801bf9f3d1d576168fafe79')
sha256sums_aarch64=('107851124102565ba1d43e66e98d06be33849f9eea694d5e387f276f5d87c58a')

package() {
	install -Dm755 rift "$pkgdir/usr/bin/rift"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
