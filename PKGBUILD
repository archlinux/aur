# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=plow-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A high-performance HTTP benchmarking tool with real-time web UI & terminal displaying"
arch=('x86_64' 'aarch64')
url="https://github.com/six-ddc/plow"
license=('Apache')
provides=('plow')
conflicts=('plow')
source_x86_64=("$url/releases/download/v$pkgver/plow_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/plow_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5e29d3f3221e6bd2b2fda80a3a1cb5ebbd6981af0bbfc09d4110b815d76c421e')
sha256sums_aarch64=('53ea34287d93cdecb1c228048cd029fb1bb266e1404ece76cf3075a6e5a0d476')

package() {
	install -Dm 755 plow -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
