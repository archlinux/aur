# Maintainer: Achmad Fathoni <fathoni DOT id AT gmail DOT com>

pkgname=evaltool-bin
pkgver=1.9.0.b
pkgrel=1
pkgdesc="Explore and test functionality of the Inertial Sense products in real-time"
arch=('x86_64')
url="https://docs.inertialsense.com/user-manual/software/evaltool/"
license=('MIT')
depends=('qt5-charts-ubuntu-ver')

source=("https://github.com/inertialsense/inertial-sense-sdk/releases/download/${pkgver}/EvalTool_${pkgver}.deb")
sha256sums=('436f5572833a70e393d44bcb780d0378c2ea9b547d1ea36b61a8754c12d401bd')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}
