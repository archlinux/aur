# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-dwine-helper
pkgver=5.6.3_1.1
pkgrel=1
pkgdesc="Modify deepin-wine to make it perform better.修改和增强deepin-wine来提升体验."
arch=("any")
url="https://gitee.com/spark-store-project/spark-wine"
license=('GPL-3.0-only')
depends=(
	'zenity'
	'p7zip'
	'python>3'
	'deepin-wine-helper'
	'dbus-python'
)
optdepends=('noto-fonts-cjk: recommended fonts')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver//_/-}/${pkgname}_5.3.6-1.1_all.deb")
sha256sums=('6d7f054e6630ac5f553ef97f6ce9e5df78200eea1f394e8dff10443961c891d8')
build() {
	bsdtar -xf "${srcdir}/data."*
}
package() {
	cp -r "${srcdir}/opt" "${pkgdir}"
}