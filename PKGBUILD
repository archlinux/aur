# Maintainer: Tan Gezerman <tangezerman@gmail.com>
pkgname=plymouth-theme-cachyos-bgrt
pkgver=1.0.0
pkgrel=1
pkgdesc="A plymouth theme featuring CachyOS logo, similar to Fedora"
arch=('any')
url="https://github.com/gezerman/plymouth-theme-cachyos-bgrt"
license=('MIT')
depends=('plymouth')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f613db6d62ffddbf8601ba2acaae07b5260907462887bd06f61f4829df4441e6')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Install the theme files
	install -d "${pkgdir}/usr/share/plymouth/themes/cachyos-bgrt"
	install -m644 cachyos-bgrt/* "${pkgdir}/usr/share/plymouth/themes/cachyos-bgrt/"

	# Install license
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
