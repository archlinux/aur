# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-deck
pkgver=0.5.1
pkgrel=1
pkgdesc="Kanban-style project & personal management tool for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/deck"
license=('AGPLv3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/deck/releases/download/v${pkgver}/deck.tar.gz")
sha512sums=("813d592017f0e3748e2bd93528721a3e6228c4f670160f964a46a11b7db64eb359760d133bf3ee6356dc8397801e5d1ba9c1751e1dc16ac532d01eda22e9ad9a")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/deck" "${pkgdir}/usr/share/webapps/nextcloud/apps/deck"
}
