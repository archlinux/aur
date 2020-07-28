# Maintainer: nullgemm <nullgemm@mailbox.org>
pkgname=plymouth-theme-psx
pkgver=v1.0
pkgrel=1
pkgdesc="PSX boot simulation"
arch=('any')
url="https://github.com/nullgemm/plymouth_psx"
license=('custom:WTFPL')
depends=('plymouth')
source=("https://github.com/nullgemm/plymouth_psx/archive/v1.0.zip")
sha256sums=('8f1c765e5b00d1ad6fa37c51e51dca727335ce3f7ee904117e7e9533e90bbe7c')

package() {
	cd "${srcdir}/plymouth_psx-1.0"
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/psx"
	install -Dvm644 * "${pkgdir}/usr/share/plymouth/themes/psx"
}
