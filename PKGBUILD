# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-deck
pkgver=0.4.0
pkgrel=1
pkgdesc="Kanban-style project & personal management tool for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/deck"
license=('AGPLv3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/deck/releases/download/v${pkgver}/deck.tar.gz")
sha512sums=("2597d2d6be39ffded1c7b4f269d049b3e948e9f12ab036ee01a269b70a3d93b463e743d37e241319e6fd9be37999b1c036b4f719cf7941956ca53d6b19c6fdfb")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/deck" "${pkgdir}/usr/share/webapps/nextcloud/apps/deck"
}
