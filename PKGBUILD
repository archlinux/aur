# Maintainer: SysAdm <sysadm.archlinux@proton.me>
# Contributor: Asuka Minato
pkgname=caido-cli
pkgver=0.37.0
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit."
arch=(x86_64 aarch64 armv7h)
url="https://caido.io/"
license=('private')
depends=(gcc-libs glibc)
provides=(caido)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-cli-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://storage.googleapis.com/caido-releases/v${pkgver}/caido-cli-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('9c18a2763ac94227ff3d1220dedcd219a8b6cf73ead9024ce141ce87c33b5554')
sha256sums_aarch64=('db04698ca82e570a568af8ea27a5863e990730db5b69d2ca49b13a157f03b098')

package() {
	install -Dm755 caido-cli -t $pkgdir/usr/bin
}
