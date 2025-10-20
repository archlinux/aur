# Maintainer: witt <1989161762 at qq dot com>
pkgname=macos-tahoe-cursor
pkgver=1.2
pkgrel=1
pkgdesc="Apple MacOS Tahoe Cursor for Linux."
arch=("any")
url="https://store.kde.org/p/2300466"
license=('custom')
source=(
	"${pkgname}-v${pkgver}.zip::https://github.com/witt-bit/MacOS-Tahoe-Cursor/releases/download/${pkgver}/MacOS-Tahoe-Cursor.zip"
)
sha256sums=('684b80296a0419597f7efeb5c80d3d9527f8a6639d0d98a498e62ed8fa8d8e12')

package() {
	install -dm755 "${pkgdir}/usr/share/icons/${pkgname}" "${pkgdir}/usr/share/icons/${pkgname}/cursors"
	# install all
	cd "${srcdir}/MacOS-Tahoe-Cursor/MacOS-Tahoe-Cursor/"
	find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/icons/${pkgname}/{}" \;
}
