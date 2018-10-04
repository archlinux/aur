# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-twofactor-gateway
_pkgname=twofactor_gateway
pkgver=0.9.0
pkgrel=4
pkgdesc="Second factor provider using an external messaging gateway (SMS, Telegram, Signal)"
arch=('any')
url="https://github.com/nextcloud/twofactor_gateway"
license=('AGPL3')
depends=('nextcloud')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/twofactor_gateway/releases/download/v${pkgver}/twofactor_gateway.tar.gz")
sha512sums=("d2adf896967d8a103a2478c8c4d1e07129909278fadbb840bc5333bd230a961cf5b562f40a2789e62bb8dfe4c9f2f855de7e255fc9804bd8c4b4233ebe33ef32")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/twofactor_gateway" "${pkgdir}/usr/share/webapps/nextcloud/apps/twofactor_gateway"
}
