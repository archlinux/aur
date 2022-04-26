# Maintainer: Achmad Fathoni <fathoni DOT id AT gmail DOT com>

pkgname=evaltool
pkgver=1.8.6.b
pkgver_=${pkgver::-2}
pkgrel=1
pkgdesc="Explore and test functionality of the Inertial Sense products in real-time"
arch=('x86_64')
url="https://docs.inertialsense.com/user-manual/software/evaltool/"
license=('MIT')
depends=('qt5-charts-ubuntu-ver')

source=("https://github.com/inertialsense/inertial-sense-sdk/releases/download/${pkgver_}/EvalTool_${pkgver}.deb")
sha256sums=('ed5faf6bc10179172bcd55c4b56f1c80939a51f9fab9d543daa5a9e53f257f3d')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}
