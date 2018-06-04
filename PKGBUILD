# Maintainer: SKywol <skywol@qq.com>
pkgname=deepin.com.baidu.pan
pkgver=5.5.4deepin8
pkgrel=1
epoch=
pkgdesc="Baidu net disk client on Deepin Wine"
arch=('i686' 'x86_64')
url="http://pan.baidu.com"
license=('Proprietary')
groups=()
depends=('deepin-wine')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-baidu-pan')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/${pkgname}/${pkgname}_${pkgver}_i386.deb")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('20383bc9574c979199cd86e85b6f5871')
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
