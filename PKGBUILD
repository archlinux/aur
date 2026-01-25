# Maintainer: Tan Gezerman <tangezerman@gmail.com>
pkgname=plymouth-theme-cachyos-bgrt
pkgver=1.0.0
pkgrel=1
pkgdesc="A plymouth theme featuring CachyOS logo, similar to Fedora"
arch=('any')
url="https://github.com/gezerman/plymouth-theme-cachyos-bgrt"
license=('MIT')
depends=('plymouth')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ed961f0e5a5c06e1be8dc18c47a34fa17969f498cde101b42352d832e7a1358')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Install the theme files
	install -d "${pkgdir}/usr/share/plymouth/themes/cachyos-bgrt"
	install -m644 cachyos-bgrt/* "${pkgdir}/usr/share/plymouth/themes/cachyos-bgrt/"

	# Install license
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
