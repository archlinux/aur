# Maintainer: SysAdm <sysadm dot archlinux at proton dot me>
# Contributor: Asuka Minato
pkgname=caido-cli
pkgver=0.34.1
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit."
arch=(x86_64 aarch64 armv7h)
url="https://caido.io/"
license=('private')
depends=(gcc-libs glibc)
provides=(caido)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-cli-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-cli-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('bc30b18aa98580cc195cf9c93addfa14bacb5c83e08799c2f4bf8450cd822852')
sha256sums_aarch64=('e878fbaefbfe4be6b49e5b2ece5889a8be6ae3548f06f23160bf0d70ad612e7f')

package() {
	install -Dm755 caido-cli -t $pkgdir/usr/bin
}
