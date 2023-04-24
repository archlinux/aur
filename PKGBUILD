# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-dwine-helper
pkgver=2.3
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
sha256sums=('a81b197be4c609e0bc545ac3f67b86f6a8efe723d037918ea4c0603185473a19')
package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
}