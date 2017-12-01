# Maintainer: edward-p <micro.fedora@gmail.com>
pkgname=deepin-wine-helper-git
deepin_name=deepin-wine-helper
pkgver=1.0deepin27
pkgrel=2
epoch=
pkgdesc="Deepin Wine Helper"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
groups=()
depends=()
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-wine-helper')
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
