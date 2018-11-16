# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-deck
pkgver=0.5.0
pkgrel=1
pkgdesc="Kanban-style project & personal management tool for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/deck"
license=('AGPLv3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/deck/releases/download/v${pkgver}/deck.tar.gz")
sha512sums=("e6cc0836eccb91c0332218866e5b52d47b3f49e7331becf7a48ca0c39a57b3761cd1dffd75fa837fb5ae54f0df3e6e84871d58c0a6de6b7c859bb61462393927")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/deck" "${pkgdir}/usr/share/webapps/nextcloud/apps/deck"
}
