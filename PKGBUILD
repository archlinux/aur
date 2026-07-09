# Maintainer: zweiler1 <marc.zweiler@outlook.at>
pkgname=fip-c-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="C Interop Module utilizing the Flint Interop Protocol"
arch=('x86_64')
url="https://github.com/flint-lang/fip"
license=('MIT')

source=( "https://github.com/flint-lang/fip/releases/download/v${pkgver}/fip-c")
sha256sums=( '9a73fe83989e18ba96523cf3bb3176eb27fa8f4fc5d40b8359d7116a7e889cd2')

package() {
	install -Dm755 fip-c "${pkgdir}/usr/bin/fip-c"
	install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
