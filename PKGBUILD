# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-radio
pkgver=0.5.0
pkgrel=1
pkgdesc="Listen to radio stations"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-radio"
license=('MIT')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-radio-${pkgver}.tar.gz::https://onny.project-insanity.org/files/radio-${pkgver}.tar.gz")
sha512sums=("e7a6c6d69584f4b7bce225d85c8e8a5063f8a821238d556a12b2b457d2d6ef3782b10a4c3a844faf2ca38b596d7671a8da50d608d4f4c985961609224fea506b")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/radio" "${pkgdir}/usr/share/webapps/nextcloud/apps/radio"
}
