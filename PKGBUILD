# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-twofactor-gateway
_pkgname=twofactor_gateway
pkgver=0.14.1
pkgrel=1
pkgdesc="Second factor provider using an external messaging gateway (SMS, Telegram, Signal)"
arch=('any')
url="https://github.com/nextcloud/twofactor_gateway"
license=('AGPL3')
depends=('nextcloud')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/twofactor_gateway/releases/download/v${pkgver}/twofactor_gateway.tar.gz")
sha512sums=("cc1c47c0de9df50560d75c6e8dfe4459fc83c93ea37542ccfb68e189557b3c9bf9cd1db1e2163520dc0ca17ae73ffe45a8e8462298ed42419abdad64a86c898d")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/twofactor_gateway" "${pkgdir}/usr/share/webapps/nextcloud/apps/twofactor_gateway"
}
