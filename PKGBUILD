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
sha256sums=('186791c1a4066ae3778a5fe51ee2b55ef34736b3c53ee05ee1a7af07a2940611')

package() {
	install -Dm644 "bgrt-no-watermark.plymouth" "${pkgdir}/usr/share/plymouth/themes/bgrt-no-watermark/bgrt-no-watermark.plymouth"
}
