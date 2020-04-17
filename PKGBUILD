# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-twofactor-gateway
_pkgname=twofactor_gateway
pkgver=0.16.0
pkgrel=1
pkgdesc="Second factor provider using an external messaging gateway (SMS, Telegram, Signal)"
arch=('any')
url="https://github.com/nextcloud/twofactor_gateway"
license=('AGPL3')
depends=('nextcloud')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/twofactor_gateway/releases/download/v${pkgver}/twofactor_gateway.tar.gz")
sha512sums=('373300671b32fc8637d1e44bc8052340ce9d2601133cbd359bdc5c850d5d525305a6481cd0706ab6ca7994b20800d484dcce8368578a34e6e29a0981a7d73c42')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/twofactor_gateway" "${pkgdir}/usr/share/webapps/nextcloud/apps/twofactor_gateway"
}
