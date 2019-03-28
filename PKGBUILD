# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=0.10.2
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-poll-${pkgver}.tar.gz::https://github.com/nextcloud/polls/releases/download/v${pkgver}/polls.tar.gz")
sha512sums=("ba5ce9b1ba2990e169b33a85fc1f98ee1a4874a497af0be333b9395121f937ab5b26a44a3f658b1cf4f596da19ae1baf1d8e2a61a6c78e246ea558b8d154ec9b")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/polls" "${pkgdir}/usr/share/webapps/nextcloud/apps/polls"
}
