# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-radio
pkgver=0.6.4
pkgrel=1
pkgdesc="Listen to radio stations"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-radio"
license=('MIT')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-radio-${pkgver}.tar.gz::https://onny.project-insanity.org/files/nextcloud-app-radio-${pkgver}.tar.gz")
sha512sums=('c84d910c3c8915085a6b7e7fe9cb35a0c83bbd5497205dfbb41ca90b4adaf159b160a00503c759df4f4088eff64dec5b08fb81b6f3081070d9b8ed89c3a56536')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/radio" "${pkgdir}/usr/share/webapps/nextcloud/apps/radio"
}
