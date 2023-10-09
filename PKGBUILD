# Contributor: Asuka Minato
pkgname=caido-cli
pkgver=0.29.0
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit."
arch=(x86_64 aarch64 armv7h)
url="https://caido.io/"
license=('private')
depends=(gcc-libs glibc)
provides=(caido)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-linux-v${pkgver}-1177c39f.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-linux-aarch64-v${pkgver}-56e07284.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-linux-armv7-v${pkgver}-8148f20a.tar.gz")
sha256sums_x86_64=('1177c39f8a6fab5d48572c1557489dfd0672a08a8d005a6450ce8e540d763c6a')
sha256sums_aarch64=('56e07284775c0da3f6016757a48f26e4b2c7538f92dd4423e984ec7faaa29d69')
sha256sums_armv7h=('8148f20a02d468f95953b102af74bc20735b71dd69a4f0fc020f95faf103cd76')

package() {
	install -Dm755 caido -t $pkgdir/usr/bin
}
