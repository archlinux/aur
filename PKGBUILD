# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-twofactor-gateway
_pkgname=twofactor_gateway
pkgver=0.15.0
pkgrel=1
pkgdesc="Second factor provider using an external messaging gateway (SMS, Telegram, Signal)"
arch=('any')
url="https://github.com/nextcloud/twofactor_gateway"
license=('AGPL3')
depends=('nextcloud')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/twofactor_gateway/releases/download/v${pkgver}/twofactor_gateway.tar.gz")
sha512sums=('df027a9442de42615d062a8f0739392fbad36ef837f0f615db54972f4fae8d0881e496c25c9b5ecfc85f4e92eb944fe921dbc761223147f3287b28f75f9eb9a1')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/twofactor_gateway" "${pkgdir}/usr/share/webapps/nextcloud/apps/twofactor_gateway"
}
