# Maintainer: 9r0k <tanyawei1991@gmail.com>
pkgname=deepin.com.weixin.work
pkgver=3.0.23.1604deepin4
pkgrel=1
epoch=
pkgdesc="Deepin Wine Weixin Work"
arch=('i686' 'x86_64')
url="https://work.weixin.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine5' 'p7zip' 'hicolor-icon-theme' 'deepin-wine-helper')
makedepends=('tar')
checkdepends=()
optdepends=('noto-fonts-cjk: Google Noto CJK fonts')
provides=()
conflicts=('deepin-wxwork')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.qq.weixin.work.deepin/com.qq.weixin.work.deepin_${pkgver}_i386.deb")
md5sums=('77e510c455a2bb1c5f1ab1d1d0c37ec4')
validpgpkeys=()

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	install -d usr/share
	mv opt/apps/com.qq.weixin.work.deepin/entries/* usr/share
}
