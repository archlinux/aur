# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tai-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="terminal ascii image -- convert images to ascii art"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/MustafaSalih1993/tai"
license=('MIT')
depends=('gcc-libs')
provides=('tai')
conflicts=('tai')
source=(
	"LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
	"README-$pkgver.md::$url/raw/v$pkgver/README.md"
)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/tai-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/tai-i686-unknown-linux-gnu.tar.gz")
source_arm=("$pkgname-$pkgver-arm.tar.gz::$url/releases/download/v$pkgver/tai-arm-unknown-linux-gnueabi.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/tai-armv7-unknown-linux-gnueabihf.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/tai-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('f56fbec69679d49e7be4268b9373b89ede5df40520b8e7dd1d929d554bdc6614'
            '070fd78c648c0cfb43d6f381e081dd0e7b1f0123a899a39676f57b6f87614aa3')
sha256sums_x86_64=('9559653d4f93b9bff76e702e5dc8463cc0ffb30dc8bfd603282ef1e0e524eb98')
sha256sums_i686=('75ee49ae73eb08f781cff7f1f20b79d61f617c1d4e020b05550b81bee70a89e4')
sha256sums_arm=('fde1dbdc97563c59811fe14763a1ba90cf0bdfe4f36a930317f8b41525e9ebfa')
sha256sums_armv7h=('4e1c9b45483a47eee354c21052f9a913d212475dd61004eb7d48d93e78e0fca7')
sha256sums_aarch64=('0a37159b0c1f093290050eb039c34ee00f21c0208acf54dd9ce71fb6b89c47ae')

package() {
	install -Dm 755 tai -t "$pkgdir/usr/bin/"
	install -Dm 444 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 444 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
