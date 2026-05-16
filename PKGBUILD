# Maintainer: SysAdm <sysadm.archlinux@proton.me>
# Contributor: Asuka Minato
pkgname=caido-cli
pkgver=0.56.2
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
sha256sums_x86_64=('730771a9fe085874f1c6647933cccf05f1b2dcf1fdee007e615dd72892746b98')
sha256sums_aarch64=('734048c1bcbbe03358d412ffe0d84b6361fae3ffd7735e4bd82f82258c8172ad')

package() {
	install -Dm755 caido-cli -t $pkgdir/usr/bin
}
