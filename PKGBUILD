# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=plow-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A high-performance HTTP benchmarking tool with real-time web UI & terminal displaying"
arch=('x86_64' 'aarch64')
url="https://github.com/six-ddc/plow"
license=('Apache')
provides=('plow')
conflicts=('plow')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/plow_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/plow_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('928eda5b6c74c20d0d70197b4c2a1cd482112083ba557d94866e5af04974d73d')
sha256sums_aarch64=('5bad7187a4ff55b27f5dd1b379fb92c12908c7e2cf7ce98bbec5b9f1bca6afb2')

package() {
	install -D plow -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
