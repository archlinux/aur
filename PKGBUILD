# Maintainer: SysAdm <sysadm.archlinux@proton.me>
# Contributor: Asuka Minato
pkgname=caido-cli
pkgver=0.59.1
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
sha256sums_x86_64=('9d0a9a7b3c0e597fbcd0e4a7ee4eca24c831391abab7997144d5a8ab61ec3ffc')
sha256sums_aarch64=('b71f51940b275993b2d734ade63d24c94cd5f028c8f9e47cda556653541fee15')

package() {
	install -Dm755 caido-cli -t $pkgdir/usr/bin
}
