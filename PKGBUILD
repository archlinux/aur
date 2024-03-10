# Maintainer: Ferdinand Bachmann <ferdinand dot bachmann at yrlf dot at>
# Contributor: Ícar N. S. <icar dot nin at pm dot me>

pkgname=plymouth-theme-bgrt-no-watermark
pkgver=1.0.1
pkgrel=1
pkgdesc='Modified BGRT theme without watermark that retains OEM logo on LUKS prompt'
arch=('any')
license=('GPL')
depends=('plymouth')
install="${pkgname}.install"
source=(
	'bgrt-no-watermark.plymouth'
)
sha256sums=('42a250c8c2979d7be94485394ad24cc71981c5bb90dafb9bf87dab0e7649d2bd')

package() {
	install -Dm644 "bgrt-no-watermark.plymouth" "${pkgdir}/usr/share/plymouth/themes/bgrt-no-watermark/bgrt-no-watermark.plymouth"
}
