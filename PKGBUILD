# Maintainer: zhullyb <zhullyb@outlook.com>
pkgname=deepin.com.qq.im.light
pkgver=7.9.14308deepin8
pkgrel=3
epoch=
pkgdesc="Deepin Wine QQ Light 7.9."
arch=('i686' 'x86_64')
url="http://im.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine5')
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
source=("https://packages.deepin.com/deepin/pool/non-free/d/${pkgname}/${pkgname}_${pkgver}_i386.deb"
  "run.sh")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('SKIP'
  "SKIP")
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgver}_i386.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
    mv run.sh ${pkgname}-${pkgver}/opt/deepinwine/apps/Deepin-QQLight/
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
	
}
