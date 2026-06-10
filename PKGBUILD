# Maintainer: zweiler1 <marc.zweiler@outlook.at>
pkgname=fip-c-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="C Interop Module utilizing the Flint Interop Protocol"
arch=('x86_64')
url="https://github.com/flint-lang/fip"
license=('MIT')

source=( "https://github.com/flint-lang/fip/releases/download/v${pkgver}/fip-c")
sha256sums=( '587441dcba543e44ed01c3435f8b7c7f6b5e07e438a73ceab0a331e140f67faa')

package() {
	install -Dm755 fip-c "${pkgdir}/usr/bin/fip-c"
	install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
