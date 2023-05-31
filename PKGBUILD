# Maintainer: shantih19 <shantih19 at gmail dot com>

pkgname=plymouth-theme-suzanne-wireframe
pkgver=1.0
pkgrel=2
pkgdesc="Plymouth Theme with wireframe Suzanne from Blender"
arch=('any')
url="https://github.com/shantih19/PlymouthTheme-Suzanne-Wireframe"
license=('GPL')
depends=('plymouth')
install="plymouth-theme-suzanne-wireframe.install"
source=("${url}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1fc8bfcf4d44d33cf0d81af43bf92bbaf54e1be966b43b7b72e1eeb8e9782c4f')

package() {
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/SuzanneWireframe"
	find "${srcdir}/PlymouthTheme-Suzanne-Wireframe-${pkgname}-${pkgver}/SuzanneWireframe" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/plymouth/themes/SuzanneWireframe/" \;
}
