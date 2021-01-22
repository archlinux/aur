# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-radio
pkgver=1.0.2
pkgrel=1
pkgdesc="Listen to radio stations"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-radio"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-radio-${pkgver}.tar.gz::https://git.project-insanity.org/onny/nextcloud-app-radio/-/jobs/1038/artifacts/raw/build/artifacts/radio.tar.gz")
sha512sums=('79cf6fd2b823f0bf4154142024f50b4c21924981eecb0bc6ae353c1abb5aebb0c888b4b50e387214a369baa7c2f6331abdb010121220b8726328c0bc52a6d0cc')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/radio" "${pkgdir}/usr/share/webapps/nextcloud/apps/radio"
}
