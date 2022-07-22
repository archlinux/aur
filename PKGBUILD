# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=plow-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="High-performance HTTP benchmarking tool"
arch=('x86_64' 'aarch64')
url="https://github.com/six-ddc/plow"
license=('Apache')
provides=('plow')
conflicts=('plow')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/plow_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/plow_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d31fe6ab100fd6e922beaf1a395ed23cb0b4651f01f7b52e9dabd3689b819dd9')
sha256sums_aarch64=('3b70ff85de021b53827734f03aeab6731ec9cf890aaa65d59374494699ed4917')

package() {
	install -D plow -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
