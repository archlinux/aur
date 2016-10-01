# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-tasks
pkgver=0.9.3
pkgrel=1
pkgdesc="Enhanced task app for NextCloud"
arch=('any')
url="https://github.com/owncloud/tasks"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("tasks-${pkgver}.tar.gz::https://github.com/owncloud/tasks/releases/download/v${pkgver}/tasks.zip")
sha512sums=("aff017f969af66ea6e37d921b9616a66c3f632a5c584edb63f9d2bbebb29504618f701cfeda22936839a073a448b86ffbcdfb01361e58a6382fe7beeeebda028")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/tasks" "${pkgdir}/usr/share/webapps/nextcloud/apps/tasks"
}
