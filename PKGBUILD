# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=modified-shop
pkgver=2.0.3.0_r10907
pkgrel=2
pkgdesc="eCommerce shopsoftware"
arch=('any')
url="http://www.modified-shop.org"
license=('GPL2')
depends=('php')
options=('!strip')
install='modified-shop.install'
source=("$pkgname-$pkgver.zip::http://www.modified-shop.org/forum/index.php?action=downloads;sa=downfile&id=124")
sha512sums=("9bfbd98402ed4f2bbef391b08f1cb5d110c9ff863901bd6395e9ba95764382edfce973ea2575c29637a7f985f2c9c1cce8af6bc8ab5b317678dcd73421a7b61d")

package() {
  install -d "${pkgdir}/usr/share/webapps"
  cp -r "${srcdir}/modified-shop_2.0.3.0-r10907_install/shoproot" "${pkgdir}/usr/share/webapps/modified-shop"
}
