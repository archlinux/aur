# Maintainer: 9r0k <tanyawei1991@gmail.com>
pkgname=deepin.com.weixin.work
pkgver=2.8.10.2010deepin0
pkgrel=1
epoch=
pkgdesc="Deepin Wine Weixin Work"
arch=('i686' 'x86_64')
url="https://work.weixin.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-wxwork')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/${pkgname}/${pkgname}_${pkgver}_i386.deb")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('a82495943fe4b748cf2b740704f1ec45')
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
