# Maintainer: wszqkzqk <wszqkzqk@gmail.com>
pkgname=deepin.com.baidu.pan
pkgver=5.7.3
_pkgver=5.7.3deepin0
pkgrel=1
epoch=
pkgdesc="Deepin Wine Baidupan"
arch=('i686' 'x86_64')
url="http://pan.baidu.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.tuna.tsinghua.edu.cn/deepin/pool/non-free/d/deepin.com.baidu.pan/deepin.com.baidu.pan_5.7.3deepin0_i386.deb")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${_pkgver}_i386.deb
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"	
}
package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
}