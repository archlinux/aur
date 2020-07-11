# Maintainer: luosoy <249799588@qq.com>

pkgname=com.qq.weixin.work.deepin
pkgver=3.0.20.1618deepin5
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
source=("https://community-packages.deepin.com/deepin/pool/non-free/c/${pkgname}/${pkgname}_${pkgver}_i386.deb")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('345393c2afc165f945fa1342413fb601')
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