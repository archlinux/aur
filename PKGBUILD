# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=plow-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="High-performance HTTP benchmarking tool"
arch=('x86_64' 'aarch64')
url="https://github.com/six-ddc/plow"
license=('Apache')
provides=('plow')
conflicts=('plow')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/plow_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/plow_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7cc1426f28a102542903033ac364b3abc11311326e3bc2bfd3e8ccc68a303a17')
sha256sums_aarch64=('9a7698dad20bdae7e43365ea78bd211437418e822a569af1da37651cc8174243')

package() {
	install -D plow -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
