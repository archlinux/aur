# Maintainer: Stephen Brennan

pkgname=plymouth-theme-nostromo
pkgver=1.3
pkgrel=1
pkgdesc='A Plymouth theme that looks like the boot screen for Alien Nostromo computers'
arch=('any')
url='https://github.com/brenns10/plymouth-theme-nostromo'
license=('GPL')
depends=('plymouth')
install="${pkgname}.install"
source=(
	"https://github.com/brenns10/plymouth-theme-nostromo/archive/v${pkgver}.tar.gz"
)
sha256sums=(
	'ccdec15de1ab899c3ec62a70d8126cc73e0145b2c27c9e2daf1ce062b37c6286'
)

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/nostromo"
	install -Dvm644 * "${pkgdir}/usr/share/plymouth/themes/nostromo"
	rm -f "${pkgdir}/usr/share/plymouth/themes/nostromo/README.md"
	rm -f "${pkgdir}/usr/share/plymouth/themes/nostromo/LICENSE.md"
}
