# Maintainer: Tab Fitts <tfitts [at] spryservers [dot] net>
pkgname=splashtop-business
pkgver=3.0.4.1
pkgrel=1
pkgdesc="Splashtop Business. Remotely access your desktop from any device from anywhere!"
arch=('x86_64')
url="https://www.splashtop.com/business"
license=('Proprietary')
depends=('bash-completion' 'curl>=7.47.0' 'ffmpeg' 'gcc>=3.0' 'hicolor-icon-theme' 'keyutils>=1.5.6' 'libpulse' 'libxcb>=1.3' 'qt5-base>=5.5.0' 'gtk3>=3.5.12' 'gdk-pixbuf2' 'tracker3-docs' 'util-linux-libs' 'xcb-util>=0.4.0' 'xcb-util-keysyms>=0.4.0' 'binutils' 'libxrandr' 'libxfixes' 'uriparser')
provides=('splashtop-business')
options=('!strip')
install=${pkgname}.install
source=("https://download.splashtop.com/linux/${pkgname}_Ubuntu_v${pkgver}_amd64.tar.gz")
sha512sums=('a0ddbdfc50d8da1e528165580993bfc4ef10bf973c8fd84b53eca0ede910efd715ad14ca48fef4db81a0922c5cf18bbe34c460039e738222aba2594cffbcd075')

prepare(){
    tar xzf ${pkgname}_Ubuntu_v${pkgver}_amd64.tar.gz
    ar -x splashtop-business_Ubuntu_amd64.deb
}

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}
