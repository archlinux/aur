# Maintainer: wszqkzqk <wszqkzqk@gmail.com>
# Maintainer: arkli <LFZ0107@outlook.com>
pkgname=deepin.com.thunderspeed
pkgver=7.10.35.366deepin17
pkgrel=2
epoch=
pkgdesc="Deepin Wine Thunderspeed"
arch=('i686' 'x86_64')
url="http://office.qq.com/"
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
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/${pkgname}/${pkgname}_${pkgver}_i386.deb")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('SKIP')
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
