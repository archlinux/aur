# Maintainer: wszqkzqk <wszqkzqk@gmail.com>
pkgname=deepin.com.thunderspeed
pkgver=7.10.35
_pkgver=7.10.35.366deepin18
pkgrel=1
epoch=
pkgdesc="Deepin Wine Thunderspeed"
arch=('i686' 'x86_64')
url="http://dl.xunlei.com/"
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
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/${pkgname}/${pkgname}_${_pkgver}_i386.deb")
noextract=("${pkgname}_${_pkgver}_i386.deb")
md5sums=('8b6894e19d625844da4a6a85ab1c40ff')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${_pkgver}_i386.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"	
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
}
