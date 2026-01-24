# Maintainer: SysAdm <sysadm.archlinux@proton.me>
# Contributor: Asuka Minato
pkgname=caido-cli
pkgver=0.55.1
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit."
arch=(x86_64 aarch64)
url="https://caido.io/"
license=('private')
depends=(gcc-libs glibc)
provides=("${pkgname}")
conflicts=("${pkgname}")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://caido.download/releases/v${pkgver}/caido-cli-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://caido.download/releases/v${pkgver}/caido-cli-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('e3146410dfd903e25414c076aa81194f4073bf641ced8f64723db9d4c08084a1')
sha256sums_aarch64=('80c424174fa6ab69d1072d2805e9c5be9ebd6f258292a9adf04e19a4ab8dc4ac')

package() {
	install -Dm755 caido-cli -t $pkgdir/usr/bin
}
