# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spark-dwine-helper
pkgver=2.4.0.1
pkgrel=1
pkgdesc="Modify deepin-wine to make it perform better.修改和增强deepin-wine来提升体验."
arch=("any")
url="https://gitee.com/deepin-community-store/spark-wine"
license=('GPL3')
depends=('sh' 'zenity' 'p7zip' 'deepin-wine-helper')
optdepends=('noto-fonts-cjk: recommended fonts')
provides=("spark-wine")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_all.deb")
sha256sums=('11824ee3d4d55280955aa24bbe45860c5aac779777e08718af55e16248d179f1')
package() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}