# Contributor: Asuka Minato
pkgname=caido-cli
pkgver=0.30.3
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit."
arch=(x86_64 aarch64 armv7h)
url="https://caido.io/"
license=('private')
depends=(gcc-libs glibc)
provides=(caido)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-cli-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-cli-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('1065b3f0cdab2b6904c1ef639a953c307ce94f837fdd3c8b5a9e4698fdafa50f')
sha256sums_aarch64=('0f449526f40c31d9784f37d712fab7960efdb37e234d1d1f9bccfe14e2e62222')

package() {
	install -Dm755 caido-cli -t $pkgdir/usr/bin
}
