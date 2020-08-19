# Maintainer: 9r0k <tanyawei1991@gmail.com>
pkgname=deepin.com.weixin.work
pkgver=3.0.20.1618deepin5
pkgrel=1
epoch=
pkgdesc="Deepin Wine Weixin Work"
arch=('i686' 'x86_64')
url="https://work.weixin.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine' 'p7zip' 'hicolor-icon-theme')
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
source=("https://community-packages.deepin.com/deepin/pool/non-free/c/com.qq.weixin.work.deepin/com.qq.weixin.work.deepin_${pkgver}_i386.deb")
md5sums=('345393c2afc165f945fa1342413fb601')
validpgpkeys=()

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	install -d usr/share
	mv opt/apps/com.qq.weixin.work.deepin/entries/* usr/share
}
