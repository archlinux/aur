# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-deck
pkgver=0.6.0
pkgrel=1
pkgdesc="Kanban-style project & personal management tool for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/deck"
license=('AGPLv3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/deck/releases/download/v${pkgver}/deck.tar.gz")
sha512sums=("7c46aa0e882658b7c49743c4fae7075d06686d611e6333152f51c0082b3a88c065361a8ec93c2fc67a020dff3d339daaefd2bff278c699c59519c267997318d7")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/deck" "${pkgdir}/usr/share/webapps/nextcloud/apps/deck"
}
