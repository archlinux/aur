# Maintainer: Alia Skywol <skywol@qq.com>
pkgname=deepin.com.wechat
pkgver=2.6.0.40deepin1
pkgrel=4
epoch=
pkgdesc="Deepin Wine Wechat 2.6.0"
arch=('i686' 'x86_64')
url="http://weixin.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine')
makedepends=('tar')
checkdepends=()
optdepends=('noto-fonts-cjk')
provides=()
conflicts=('deepin-wechat')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/${pkgname}/${pkgname}_${pkgver}_i386.deb")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('75f258819b3000ba05522b32f23529a2')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgver}_i386.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"	
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
}
