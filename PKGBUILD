# Maintainer: edward-p <micro.fedora@gmail.com>
pkgname=deepin.com.qq.office-git
deepin_name=deepin.com.qq.office
pkgver=2.0.0deepin1
pkgrel=2
epoch=
pkgdesc="Deepin Wine TIM (on deepin-wine)"
arch=('i686' 'x86_64')
url="http://office.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine-git')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin.com.qq.office')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/${deepin_name}/${deepin_name}_${pkgver}_i386.deb")
noextract=("${deepin_name}_${pkgver}_i386.deb")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	ar -x ${deepin_name}_${pkgver}_i386.deb
	mkdir ${deepin_name}-${pkgver}
	tar -xf data.tar.xz --directory="${deepin_name}-${pkgver}"	
}

package() {
	cd "${deepin_name}-${pkgver}"
	cp -r ./ ${pkgdir}/
}
