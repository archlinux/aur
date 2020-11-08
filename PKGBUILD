pkgname=deepin.com.wechat
_pkgver=2.6.8.65
pkgver=2.6.8.65
pkgrel=1
epoch=
pkgdesc="Deepin Wine WeChat"
arch=('i686' 'x86_64')
url="http://pc.weixin.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine5')
makedepends=('tar')
checkdepends=()
optdepends=('noto-fonts-cjk')
provides=()
conflicts=('deepin-wine-wechat' 'deepin.com.wechat2')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://community-packages.deepin.com/deepin/pool/non-free/d/deepin.com.wechat/deepin.com.wechat_2.6.8.65deepin0_i386.deb")
noextract=("${pkgname}_${_pkgver}deepin0_i386.deb")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${_pkgver}deepin0_i386.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"	
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
#	mkdir -p ${pkgdir}/usr/share/applications
#	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
#	cp -r ${srcdir}/${pkgname}-${pkgver}/opt/apps/${pkgname}/entries/icons/ ${pkgdir}/usr/share/
}
