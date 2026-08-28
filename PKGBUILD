# Maintainer: zweiler1 <marc.zweiler@outlook.at>
pkgname=fip-c-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="C Interop Module utilizing the Flint Interop Protocol"
arch=('x86_64')
url="https://github.com/flint-lang/fip"
license=('MIT')

source=( "https://github.com/flint-lang/fip/releases/download/v${pkgver}/fip-c")
sha256sums=( '90f965f4636b25b8c06263e93f37726f95f433d6795c02a7dfe9edb5a1e15a79')

package() {
	install -Dm755 fip-c "${pkgdir}/usr/bin/fip-c"
	install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
