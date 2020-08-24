# Maintainer: Rand01ph <tanyawei1991@gmail.com>
pkgname=com.qq.tim.dcs
pkgver=3.1.0.21789
pkgrel=1
epoch=
pkgdesc="Tencent TIM Client on Deepin Wine 5 (from Spark Store)"
arch=('i686' 'x86_64')
url="http://tim.qq.com/"
license=('unknown')
groups=()
depends=('deepin-wine5' 'p7zip' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('ttf-ms-fonts: Microsoft Core fonts'
			'noto-fonts-cjk: Google Noto CJK fonts')
provides=()
#conflicts=('deepin-wine-tim')
replaces=()
backup=()
options=()
install=tim.install
changelog=
source=("http://dcstore.shenmo.tech/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb")
sha512sums=('84de5249869940898324977c7312f1ad61567748fb4a6b5a513da64b1308fbad98bcb6af7a87a9c39a9284d97b96a9f3901abcb9d296b0ef778df051792ccdfe')
validpgpkeys=()

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	install -d usr/share
	mv opt/apps/${pkgname}/entries/* usr/share
}
