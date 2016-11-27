# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-calendar
pkgver=1.4.1
pkgrel=1
pkgdesc="Calendar App for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/calendar"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/calendar/releases/download/v$pkgver/calendar.tar.gz")
sha512sums=("854ea0c3007451513b3ac267d66b6fa085e6af258be5816875416f4be68c29bf959fefd0ce553a0e8bae4ba340d74efe2909e03ee59b6e828280da57e4133aae")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/calendar" "${pkgdir}/usr/share/webapps/nextcloud/apps/calendar"
}
