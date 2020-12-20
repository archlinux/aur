# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-reddit
pkgver=0.0.6
pkgrel=1
pkgdesc="Reddit integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_reddit"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_reddit/releases/download/v${pkgver}/integration_reddit-${pkgver}.tar.gz")
sha512sums=('cf2ee16572ef492a85cb87b286dbd50aad6832b9772a6404f3c998fd31866b1a5d45090699ae689c4e2eb6c51304b5973815e470c80f930720ebb681e79205cd')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_reddit" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_reddit"
}
