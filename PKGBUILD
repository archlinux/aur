# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nats-top-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="A top-like tool for monitoring NATS servers"
arch=(x86_64 aarch64 armv7h i686)
url="https://github.com/nats-io/nats-top"
license=(MIT)
depends=(glibc)
provides=(nats-top)
conflicts=(nats-top)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/nats-top_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/nats-top_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/nats-top_${pkgver}_linux_armv7.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/nats-top_${pkgver}_linux_386.tar.gz")
sha256sums_x86_64=('b2923e529171f559fa21f15a525593762ecb2b2e1b868dcb4bf95d8212fa33a9')
sha256sums_aarch64=('570d80000f0c66caa4f750f57699f7eb8e8b7007e723d346a348ca6739c9f711')
sha256sums_armv7h=('e93d424da2a2485ae004fdff3cad5bff5d564b775fc19d496109f5e8a20f317e')
sha256sums_i686=('8281b03dff22d5abd6a0f5d95b7bbf315d3d55f64adbb56633c712e63a783d75')

package() {
    install -Dm755 nats-top -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
