# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: 9r0k <tanyawei1991@gmail.com>
pkgname=com.qq.tim.spark
pkgver=3.3.9.22051spark1
pkgrel=1
epoch=
pkgdesc="Tencent TIM Client on Deepin Wine 5 (from Spark Store)"
arch=('i686' 'x86_64')
url="https://tim.qq.com/"
license=('unknown')
groups=()
depends=(
	'bash'
	'deepin-wine5'
	'deepin-wine-helper'
	'hicolor-icon-theme'
)
checkdepends=()
optdepends=()
provides=()
conflicts=('com.qq.tim.dcs')
replaces=()
backup=()
options=()
# install=tim.install
changelog=
source=("https://d.store.deepinos.org.cn/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb")
sha512sums=('bb4ccf58f074c893a97a9d92ab9e378e5045d761e706ec072731ffa379aa32b35c278acf8c01f51515dae82fafb3d8d43e64afb436d276e60f3c6ebad91d26a3')
validpgpkeys=()


package() {
	cd "${pkgdir}"
	bsdtar -xpvf "${srcdir}/data.tar.xz"
    sed -i 's/TIM.exe/tim.exe/' usr/share/applications/com.qq.tim.spark.desktop
	rm -rf opt/apps/${pkgname}/{entries/,info}
}
