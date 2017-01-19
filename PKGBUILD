# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-calendar
pkgver=1.5.0
pkgrel=1
pkgdesc="Calendar App for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/calendar"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/calendar/releases/download/v$pkgver/calendar.tar.gz")
sha512sums=("94023781aa8700054757beeae719ea9bdb8c71978b24edc0154ba060cfec1d65fd0784d0ed419990028612b98bed36e43c16cfac2e1b7f2bf63053b84298a35d")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/calendar" "${pkgdir}/usr/share/webapps/nextcloud/apps/calendar"
}
