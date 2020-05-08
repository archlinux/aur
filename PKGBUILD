# Maintainer: Your Name <jean@finas.io>
pkgname=qsync
pkgver=1.0.5.0305
pkgrel=1
epoch=1
pkgdesc="QNap's synchronization client"
# url="" TODO add this later
arch=('x86_64')
license=('custom')
optdepends=('nautilus: this client has nautlius integration')
# backup=() TODO do i need this?
changelog=
#TODO add download links
source=("${pkgname}-${pkgver}.deb::https://download.qnap.com/Storage/Utility/QNAPQsyncClientUbuntux64-${pkgver}.deb")
noextract=()
md5sums=("9c34cb93a86e1d3364c12a4a1270232d")

package() {
	cd $srcdir

	ar x "${pkgname}-${pkgver}.deb"

	tar -xf data.tar.xz -C "${pkgdir}"


}
