# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-dwine-helper
pkgver=2.0.1
pkgrel=1
pkgdesc="Modify deepin-wine to make it perform better.修改和增强deepin-wine来提升体验."
arch=(any)
url="https://gitee.com/deepin-community-store/spark-wine"
license=('GPL3')
depends=('sh')
optdepends=('noto-fonts-cjk: recommended fonts')
provides=("spark-wine")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_all.deb")
sha256sums=('54f4cd69c299bf19b781bd8db5a7d6763b10b11c816e33930790e186b437665c')
package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
}