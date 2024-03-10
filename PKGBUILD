# Maintainer: Ferdinand Bachmann <ferdinand dot bachmann at yrlf dot at>
# Contributor: Ícar N. S. <icar dot nin at pm dot me>

pkgname=plymouth-theme-bgrt-no-watermark
pkgver=1.0.0
pkgrel=1
pkgdesc='Modified BGRT theme without watermark that retains OEM logo on LUKS prompt'
arch=('any')
license=('GPL')
depends=('plymouth')
install="${pkgname}.install"
source=(
	'bgrt-no-watermark.plymouth'
)
sha256sums=('53a7e07c1c0422939384a4345ad776cbd15425d242b58fe63895830c2ff2fce8')

package() {
	install -Dm644 "bgrt-no-watermark.plymouth" "${pkgdir}/usr/share/plymouth/themes/bgrt-no-watermark/bgrt-no-watermark.plymouth"
}
