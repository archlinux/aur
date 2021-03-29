# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-reddit
pkgver=0.0.11
pkgrel=1
pkgdesc="Reddit integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_reddit"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_reddit/releases/download/v${pkgver}/integration_reddit-${pkgver}.tar.gz")
sha512sums=('c8fd14e40681551bb4298b3f36cab91421f6f144c8551dcdc14c0b126a9d63fb7d3f182713e372d02155f8699ec01a87d04e004c6234e8aab35b7874792d6f3a')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_reddit" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_reddit"
}
