# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-radio
pkgver=1.0.1
pkgrel=1
pkgdesc="Listen to radio stations"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-radio"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-radio-${pkgver}.tar.gz::https://git.project-insanity.org/onny/nextcloud-app-radio/-/jobs/934/artifacts/raw/build/artifacts/radio.tar.gz")
sha512sums=('9099eeeb87bf4800dc8e1eb2de1e6a8f25dcfd2931849cef16123b504cb0bfbb5d7665e9fe9de64620570d053f0c08b2afdb9cc04e5677336746fab521eaf488')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/radio" "${pkgdir}/usr/share/webapps/nextcloud/apps/radio"
}
