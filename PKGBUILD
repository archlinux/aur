# Maintainer: Tab Fitts <tfitts [at] spryservers [dot] net>
pkgname=splashtop-business
pkgver=3.5.2.0
pkgrel=1
pkgdesc="Splashtop Business. Remotely access your desktop from any device from anywhere!"
arch=('x86_64')
url="https://www.splashtop.com/business"
license=('Proprietary')
depends=('bash-completion' 'curl>=7.47.0' 'ffmpeg' 'gcc>=3.0' 'hicolor-icon-theme' 'keyutils>=1.5.6' 'libpulse' 'libxcb>=1.3' 'qt5-base>=5.5.0' 'gtk3>=3.5.12' 'gdk-pixbuf2' 'tracker3-docs' 'util-linux-libs' 'xcb-util>=0.4.0' 'xcb-util-keysyms>=0.4.0' 'binutils' 'libxrandr' 'libxfixes' 'uriparser')
provides=('splashtop-business')
options=('!strip')
install=${pkgname}.install
source=("https://download.splashtop.com/linuxclient/${pkgname}_Ubuntu_v${pkgver}_amd64.tar.gz")
sha512sums=('ad307b322704f2996ce16bf82842c14ba687f118367fb3da980018d53773bcd92ab7eadb69f7526f5ef1a2115f84e125573eed9b56e2d0c07ac44b32a8f8598f')

prepare(){
    tar xzf ${pkgname}_Ubuntu_v${pkgver}_amd64.tar.gz
    ar -x splashtop-business_Ubuntu_amd64.deb
}

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}
