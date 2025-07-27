# Maintainer: witt <1989161762 at qq dot com>
pkgname=macos-tahoe-cursor
pkgver=1.0
pkgrel=1
pkgdesc="Apple MacOS Tahoe Cursor for Linux."
arch=("any")
url="https://store.kde.org/p/2300466"
license=('custom')
source=(
	"${pkgname}-v${pkgver}.zip::https://github.com/witt-bit/MacOS-Tahoe-Cursor/releases/download/1.0/MacOS-Tahoe-Cursor.zip"
)
sha256sums=('8440ba07efb16785e5b352c61eed90f2a6d3ad26ba61f88d768cb49fcf4f2877')

package() {
	install -dm755 "${pkgdir}/usr/share/icons/${pkgname}" "${pkgdir}/usr/share/icons/${pkgname}/cursors"
	# install all
	cd "${srcdir}/MacOS-Tahoe-Cursor/MacOS-Tahoe-Cursor/"
	find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/icons/${pkgname}/{}" \;
}
