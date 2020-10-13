# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-twitter
pkgver=0.0.4
pkgrel=1
pkgdesc="Twitter integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_twitter"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_twitter/releases/download/v${pkgver}/integration_twitter-${pkgver}.tar.gz")
sha512sums=('2136f9f58da5dd1d35c492fc76c0ae555e16828d379164d5a59a3e4164a5650cbed8ef3140dbfbbf654eb891eddcb94ace94146efc82a7e73868ef837d09356a')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_twitter" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_twitter"
}
