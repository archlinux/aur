# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-dwine-helper
pkgver=2.5
pkgrel=1
pkgdesc="Modify deepin-wine to make it perform better.修改和增强deepin-wine来提升体验."
arch=("any")
url="https://gitee.com/deepin-community-store/spark-wine"
license=('GPL3')
depends=(
	'zenity'
	'p7zip'
	'python2'
	'deepin-wine-helper'
)
optdepends=('noto-fonts-cjk: recommended fonts')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_all.deb")
sha256sums=('c9766172cca7c35e6a5d5302c84a97a62f0ed3b1af3792c9eb4ea059f5f822fa')
build() {
	bsdtar -xf "${srcdir}/data.tar.xz"
}
package() {
	cp -r "${srcdir}/opt" "${pkgdir}"
}