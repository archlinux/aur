# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-dwine-helper
pkgver=2.3.1
pkgrel=1
pkgdesc="Modify deepin-wine to make it perform better.修改和增强deepin-wine来提升体验."
arch=("any")
url="https://gitee.com/deepin-community-store/spark-wine"
license=('GPL3')
depends=('sh' 'zenity' 'p7zip')
optdepends=('noto-fonts-cjk: recommended fonts')
provides=("spark-wine")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_all.deb")
sha256sums=('6324852320e586712798c568d961ba9230b6e5b32dcb535c9dbf3cc8f2ecb9ec')
package() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}