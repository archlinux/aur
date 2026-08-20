# Maintainer: SysAdm <sysadm.archlinux@proton.me>
# Contributor: Asuka Minato
pkgname=caido-cli
pkgver=0.58.0
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
sha256sums_x86_64=('2c950e800b8658c37951ef0dc5b60eb9d04e0e56f786402e49f76d44931f884e')
sha256sums_aarch64=('a0315c6c4bc69213553b6d5f1643b4420f1915d6ad877d42423830ebd388c3e1')

package() {
	install -Dm755 caido-cli -t $pkgdir/usr/bin
}
