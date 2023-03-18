# Maintainer: Achmad Fathoni <fathoni DOT id AT gmail DOT com>

pkgname=evaltool-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="Explore and test functionality of the Inertial Sense products in real-time"
arch=('x86_64')
url="https://docs.inertialsense.com/user-manual/software/evaltool/"
license=('MIT')
depends=('qt5-charts-ubuntu-ver')

source=("https://github.com/inertialsense/inertial-sense-sdk/releases/download/${pkgver}/EvalTool_${pkgver}.deb")
sha256sums=('64febb9f15a03177aa56a0109bf0be674f20ce4e9a8b20b14a82d560874bcef0')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}
