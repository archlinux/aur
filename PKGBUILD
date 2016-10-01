# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-calendar
pkgver=1.4.0
pkgrel=1
pkgdesc="Calendar App for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/calendar"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/calendar/releases/download/v$pkgver/calendar.tar.gz")
sha512sums=("fd6e00d70bd09bd71338e875f34de7f17c8aee4ca3dc6df0a614035cce1a75f07a8113dd02b3f5a3f4d36f6182ba49ee31a71b1136a677f993f71ffebbe90082")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/calendar" "${pkgdir}/usr/share/webapps/nextcloud/apps/calendar"
}
