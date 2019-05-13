# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-radio
pkgver=0.6.5
pkgrel=1
pkgdesc="Listen to radio stations"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-radio"
license=('MIT')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-radio-${pkgver}.tar.gz::https://onny.project-insanity.org/files/nextcloud-app-radio-${pkgver}.tar.gz")
sha512sums=('8b5049ef087957384fc8d09aa5acc5ae3d370f13fc5162b26ce96f363bb8a3c2291ba7fb899345656c3c4d3a3039be00d7941735eea792a75d8d78dd31aa7949')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/radio" "${pkgdir}/usr/share/webapps/nextcloud/apps/radio"
}
