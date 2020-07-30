# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.qq.weixin.dcs
pkgver=2.9.5.41
pkgrel=1
epoch=
pkgdesc="Tencent WeChat Client on Deepin Wine 5"
arch=('i686' 'x86_64')
url="http://weixin.qq.com/"
license=('unknown')
groups=()
depends=('deepin-wine5' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
#optdepends=('zenity: Display process bar')
provides=()
#conflicts=('deepin-wine-wechat' 'deepin.com.wechat')
replaces=()
backup=()
options=()
install=wechat.install
changelog=
source=("http://store.jerrywang.top/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb")
sha512sums=("850297e7741c1bbeef12cd2fdcf85de707c7b13669de934f8c369801e44c9119a57fab69c321f1c77b79c9e3ee24ffd47784de9cfe704caa53e6c2bf0c9f65d2")
validpgpkeys=()

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	install -d usr/share
	mv opt/durapps/${pkgname}/entries/* usr/share
}
