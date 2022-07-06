# Maintainer: Achmad Fathoni <fathoni DOT id AT gmail DOT com>

pkgname=evaltool-bin
pkgver=1.8.6.d
pkgrel=1
pkgdesc="Explore and test functionality of the Inertial Sense products in real-time"
arch=('x86_64')
url="https://docs.inertialsense.com/user-manual/software/evaltool/"
license=('MIT')
depends=('qt5-charts')

source=("https://github.com/inertialsense/inertial-sense-sdk/releases/download/${pkgver}/EvalTool_${pkgver}.deb")
sha256sums=('3dc4cfe918d9a73c52314931e18063a868211ed5d7a2acbe95a3c6f0e0851e6e')

package(){
	# Extract package data
	tar xf data.tar.zst -C "${pkgdir}"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}
