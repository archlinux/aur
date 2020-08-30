# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-twofactor-gateway
_pkgname=twofactor_gateway
pkgver=0.17.0
pkgrel=1
pkgdesc="Second factor provider using an external messaging gateway (SMS, Telegram, Signal)"
arch=('any')
url="https://github.com/nextcloud/twofactor_gateway"
license=('AGPL3')
depends=('nextcloud')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/twofactor_gateway/releases/download/v${pkgver}/twofactor_gateway.tar.gz")
sha512sums=('5da05d7f9dd8c70a396fea47702f3c0c280b3844729ab7485474fd68684ad6b02ade3995648170b728e05f26c2161599a3e40285a47db479be6b8d796f9835cb')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/twofactor_gateway" "${pkgdir}/usr/share/webapps/nextcloud/apps/twofactor_gateway"
}
