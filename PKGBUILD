# Maintainer: Ícar N. S. <icar dot nin at pm dot me>

pkgname=plymouth-theme-bgrt-better-luks
pkgver=1
pkgrel=1
pkgdesc='Modified BGRT theme that retains the OEM logo on LUKS passphrase prompt.'
arch=('any')
license=('GPL')
depends=('plymouth')
install="${pkgname}.install"
source=(
	'bgrt-better-luks.plymouth'
)
sha256sums=('53a7e07c1c0422939384a4345ad776cbd15425d242b58fe63895830c2ff2fce8')

package() {
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/bgrt-better-luks"
	install -Dvm644 * "${pkgdir}/usr/share/plymouth/themes/bgrt-better-luks/bgrt-better-luks.plymouth"
}
