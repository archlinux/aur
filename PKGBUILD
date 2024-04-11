# Maintainer: SysAdm <sysadm dot archlinux at proton dot me>
# Contributor: Asuka Minato
pkgname=caido-cli
pkgver=0.35.0
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit."
arch=(x86_64 aarch64 armv7h)
url="https://caido.io/"
license=('private')
depends=(gcc-libs glibc)
provides=(caido)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-cli-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-cli-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('d401a5405311aba538b758a0c5bbc7ec07754193b0a2553f9015d2b29d0a6a90')
sha256sums_aarch64=('69f551420c92fd0c881d6bfc9b11eac8413bff3dc7760496754fe6c8109c0ea4')

package() {
	install -Dm755 caido-cli -t $pkgdir/usr/bin
}
