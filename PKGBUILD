# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-tasks
pkgver=0.9.4
pkgrel=1
pkgdesc="Enhanced task app for NextCloud"
arch=('any')
url="https://github.com/nextcloud/tasks"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("tasks-${pkgver}.tar.gz::https://github.com/owncloud/tasks/releases/download/v${pkgver}/tasks.zip")
sha512sums=("f0db3893f432d33716ed7d3b770100a516ab3d7ee4cd0aed88ecc9271b5a6758061699ce9d8483f7b7f6f02d15c2b1662fe7c8dc249242f621ab0e707c26202b")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/tasks" "${pkgdir}/usr/share/webapps/nextcloud/apps/tasks"
}
