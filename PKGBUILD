# Contributor: Asuka Minato
pkgname=caido-cli
pkgver=0.26.0
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit."
arch=(x86_64 aarch64 armv7h)
url="https://caido.io/"
license=('private')
depends=(gcc-libs glibc)
provides=(caido)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-linux-v${pkgver}-c751833e.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-linux-aarch64-v${pkgver}-cda37369.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-linux-armv7-v${pkgver}-09bf61f1.tar.gz")
sha256sums_x86_64=('c751833e10d196ab03928d6e8c5cd97b7db9f4d5079fbb9a2c0418166c7ba786')
sha256sums_aarch64=('cda37369c16b2e71d4d33a056d1ff93ab1396854a08885265a16ebb8232647ac')
sha256sums_armv7h=('09bf61f10234fe467b93c9d82c7159d8e8b5fb0851d92cb80c3cea5b2679c5b5')

package() {
	install -Dm755 caido -t $pkgdir/usr/bin
}
