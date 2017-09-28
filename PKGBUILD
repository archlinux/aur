# Maintainer: Alia Skywol <skywol@qq.com>
pkgname=deepin.com.wechat
pkgver=2.4.5.48deepin2
pkgrel=1
epoch=
pkgdesc="Deepin Wine Wechat 2.4.5"
arch=('i686' 'x86_64')
url="http://weixin.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-wechat')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/${pkgname}/${pkgname}_${pkgver}_i386.deb")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('65a297ea7ec081cb43b68e1b32ab63b3')
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
