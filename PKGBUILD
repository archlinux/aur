# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-twofactor-gateway
_pkgname=twofactor_gateway
pkgver=0.8.0
pkgrel=1
pkgdesc="Second factor provider using an external messaging gateway (SMS, Telegram, Signal)"
arch=('any')
url="https://github.com/nextcloud/twofactor_gateway"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/twofactor_gateway/archive/v${pkgver}.tar.gz")
sha512sums=("13a5aff4fcd8c93a270e31a14b46a47c010f35c3b72cfcad6c4b57bf0d322ab62f2bf245aead3acdffc928e3f1b97156d7c721e5d8e1afc8b554681a7fbccf7f")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_pkgname}"
}
