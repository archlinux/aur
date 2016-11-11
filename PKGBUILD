# Maintainer: Polichronucci <nick at discloud dot eu>

pkgname=owncloud-app-ocsms
pkgver=1.10.1
pkgrel=1
pkgdesc="Push your Android SMS to your ownCloud instance."
arch=('any')
url="https://github.com/nerzhul/ocsms"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nerzhul/ocsms/archive/v${pkgver}.tar.gz")
sha512sums=('5824fdd6284c4260b97cdba7cbc7c9c644e8e3f58159a04e5eace646d5f0c9f72cbf5ab14746a3fcf440dcfaaf785c8b7914eca70bdc60d434a84881c81edb03')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/ocsms-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/ocsms"
}
