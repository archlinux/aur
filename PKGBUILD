# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-twitter
pkgver=1.0.0
pkgrel=1
pkgdesc="Twitter integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_twitter"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_twitter/releases/download/v${pkgver}/integration_twitter-${pkgver}.tar.gz")
sha512sums=('00773e3bad79de77522852fadf1b28c2b7eae83843c0b7efc3a672b7a53c987968accee1b725965015549ec1af16a801e72b99a7d74b20016126899f4c1994dd')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_twitter" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_twitter"
}
