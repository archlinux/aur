# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=plow-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A high-performance HTTP benchmarking tool with real-time web UI & terminal displaying"
arch=('x86_64' 'aarch64')
url="https://github.com/six-ddc/plow"
license=('Apache')
provides=('plow')
conflicts=('plow')
source_x86_64=("$url/releases/download/v$pkgver/plow_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/plow_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('386f073bcfc1664b91e25c6946ffbfd1071a375599612da633923e575a404ee0')
sha256sums_aarch64=('7a284de59cb86d52c75660452f2650fa2183355fe2e60e028f670918f2dbcffa')

package() {
	install -Dm 755 plow -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
