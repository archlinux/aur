# Maintainer: edward-p <micro.fedora@gmail.com>
pkgname=deepin-wine-uninstaller-git
deepin_name=deepin-wine-uninstaller
pkgver=0.1deepin2
pkgrel=2
epoch=
pkgdesc="Deepin Wine Uninstaller"
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
