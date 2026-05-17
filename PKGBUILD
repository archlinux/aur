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
sha256sums_x86_64=('494932b2215d1f88a503a30a60c892a82f34364619f5854effb093d21418fbe4')
sha256sums_aarch64=('ad8473a378988d602f4469b5fb004b1a4af7794a0019b8bbd7e017d2a9a8217b')

package() {
	install -Dm755 caido-cli -t $pkgdir/usr/bin
}
