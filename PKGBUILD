# Maintainer: Michael Schlapa <michael@schlapa.eu>
# Contributor: Michael Schlapa <michael@schlapa.eu>

pkgname=nextcloud-app-cookbook
pkgver=0.10.2
pkgrel=1
pkgdesc="Cookbook for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/cookbook"
license=('AGPL3')
depends=('nextcloud')
source=("nextcloud-app-cookbook-${pkgver}.tar.gz::https://github.com/nextcloud/cookbook/releases/download/v${pkgver}/Cookbook-${pkgver}.tar.gz")
sha512sums=('698c6b746d69269670aa297d7d57f06f1ef48a2669b1799278a0d055c08e505d895cd24ae0b4b148b3d1bdfe260185d4d5dd2c30d02e614eee6902a1bd102ffd')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/cookbook" "${pkgdir}/usr/share/webapps/nextcloud/apps/cookbook"
}
