# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=com.qq.weixin.dcs
pkgver=2.9.5.56
pkgrel=1
epoch=
pkgdesc="Tencent WeChat Client on Deepin Wine 5 (from Spark Store)"
arch=('i686' 'x86_64')
url="http://weixin.qq.com/"
license=('unknown')
groups=()
depends=('deepin-wine5' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
#conflicts=('deepin-wine-wechat' 'deepin.com.wechat')
replaces=()
backup=()
options=()
install=wechat.install
changelog=
source=("http://store.jerrywang.top/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb")
sha512sums=('acb06c23d921ca838154487d54638b9cac06ac4b8867c0572a258f9744140218b6ef9a99e97f9076acf7b6cc5b05217960ffbafb55800232e90c30c6c3641d21')
validpgpkeys=()

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	install -d usr/share
	mv opt/durapps/${pkgname}/entries/* usr/share
}
