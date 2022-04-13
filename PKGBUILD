# Maintainer: Leptopoda <rimikis.nikolas+development [at] gmail [dot] com>

pkgname=plymouth-theme-lenovo-bgrt
pkgver=1
pkgrel=1
pkgdesc='Adapted bgrt theme that enables flicker free boot on encrypted Lenovo devices.'
arch=('any')
url='https://gitlab.rimikis.de/Leptopoda/plymouth-bgrt-lenovo'
license=('GPL')
depends=('plymouth')
install="${pkgname}.install"
source=(
	'bgrt-lenovo.plymouth'
)
sha256sums=(
	'9e2fe71f25cdcd89f51d58244fbe2b921c48e1d3ce5629e11c9c94e16574146c'
)

package() {
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/bgrt-lenovo"
    install -Dm0644 -t "${pkgdir}/usr/share/plymouth/themes/bgrt-lenovo" ${source[0]}
}
