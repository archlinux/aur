# Maintainer: wszqkzqk <wszqkzqk@gmail.com>
# Maintainer: skywol <skywol@qq.com>
pkgname=deepin-libwine
pkgvers=2.18-8~rc4
pkgver=2.18_8
pkgrel=2
epoch=
pkgdesc="Deepin Libwine"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
groups=()
depends=()
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/deepin-wine/${pkgname}_${pkgvers}_i386.deb")
noextract=("${pkgname}_${pkgvers}_i386.deb")
md5sums=('c1c386aa15d751c5b4d29e44e474fcb9')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgvers}_i386.deb
	mkdir ${pkgname}-${pkgvers}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgvers}"
}

package() {
	cd "${pkgname}-${pkgvers}"
	cp -rf ./ ${pkgdir}/
}
