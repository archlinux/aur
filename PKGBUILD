# Maintainer: SysAdm <sysadm.archlinux@proton.me>
# Contributor: Asuka Minato
pkgname=caido-cli
pkgver=0.39.0
pkgrel=2
pkgdesc="A lightweight web security auditing toolkit."
arch=(x86_64 aarch64 armv7h)
url="https://caido.io/"
license=('private')
depends=(gcc-libs glibc)
provides=(caido-cli)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-cli-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-cli-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('23c505dabcc829fa5caf1caf0dae0045e58320738a4c28f7111696846d71186d')
sha256sums_aarch64=('af1530340629c36b0636d8ff530a99e56c39b9b1cefb1d7a8c134921b6c41190')

package() {
	install -Dm755 caido-cli -t $pkgdir/usr/bin
}
