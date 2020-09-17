# Maintainer: 9r0k <tanyawei1991@gmail.com>
pkgname=com.qq.music.deepin
_pkgver=17.73deepin7
pkgver=17.73deepin
pkgrel=7
epoch=
pkgdesc="Deepin Wine QQ Music"
arch=('i686' 'x86_64')
url="https://y.qq.com"
license=('Proprietary')
groups=()
depends=('deepin-wine5' 'p7zip' 'hicolor-icon-theme')
makedepends=('tar')
checkdepends=()
optdepends=('noto-fonts-cjk: Google Noto CJK fonts')
provides=()
conflicts=('deepin.com.qq.qqmusic')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.qq.music.deepin/com.qq.music.deepin_${_pkgver}_i386.deb")
md5sums=('3c53a46bc9ec6eedaec46b763d96b392')
validpgpkeys=()

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	install -d usr/share
	mv opt/apps/com.qq.music.deepin/entries/* usr/share
}
