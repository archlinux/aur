# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-radio
pkgver=0.6.1
pkgrel=1
pkgdesc="Listen to radio stations"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-radio"
license=('MIT')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-radio-${pkgver}.tar.gz::https://onny.project-insanity.org/files/nextcloud-app-radio-${pkgver}.tar.gz")
sha512sums=("0fab4e142e0951e2b97b08be71be0462ec6f7f01f4710be2b541e8c180a286fc5efe331954d867f6c795df98ba521254d1be456f95fbf0e650dfc200a67f94f7")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/radio" "${pkgdir}/usr/share/webapps/nextcloud/apps/radio"
}
