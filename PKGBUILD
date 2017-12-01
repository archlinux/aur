# Maintainer: edward-p <micro.fedora@gmail.com>
pkgname=deepin-fonts-wine-git
deepin_name=deepin-fonts-wine
pkgvers=2.18-2
pkgver=2.18_2
pkgrel=2
epoch=
pkgdesc="Deepin Wine Fonts"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
groups=()
depends=()
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-fonts-wine')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/deepin-wine/${deepin_name}_${pkgvers}_all.deb")
noextract=("${deepin_name}_${pkgvers}_all.deb")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	ar -x ${deepin_name}_${pkgvers}_all.deb
	mkdir ${deepin_name}-${pkgvers}
	tar -xf data.tar.xz --directory="${deepin_name}-${pkgvers}"	
}

package() {
	cd "${deepin_name}-${pkgvers}"
	cp -r ./ ${pkgdir}/
}
