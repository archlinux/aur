# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=deepinwine-qq
pkgver=7.1.14522deepin5
pkgrel=2
epoch=
pkgdesc="Deepin Wine QQ 7.1."
arch=('i686' 'x86_64')
url="http://im.qq.com/"
license=('unknown')
groups=()
depends=('deepin-crossover' 'crossover')
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
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/${pkgname}/${pkgname}_${pkgver}_i386.deb")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('b6b3d6b428ab41106ba6b0f065b17606')
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
