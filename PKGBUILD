# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-radio
pkgver=1.0.3
pkgrel=1
pkgdesc="Listen to radio stations"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-radio"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-radio-${pkgver}.tar.gz::https://git.project-insanity.org/onny/nextcloud-app-radio/-/jobs/1230/artifacts/raw/build/artifacts/radio.tar.gz")
sha512sums=('93645290f387944f7c4243e1255fc5cd1e2e8526b99133946cedd1567adcf3fb9532959fa3ca3bf2958624ee75104ea98c8d8829fd380fbe7d680e267d0efac0')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/radio" "${pkgdir}/usr/share/webapps/nextcloud/apps/radio"
}
