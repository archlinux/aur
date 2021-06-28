# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-reddit
pkgver=1.0.1
pkgrel=1
pkgdesc="Reddit integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_reddit"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_reddit/releases/download/v${pkgver}/integration_reddit-${pkgver}.tar.gz")
sha512sums=('25f29b861e223f3468d67e2cdfba36725e50031709f6fe1af21f61e730fb0af00d3c5325478f131633e54c94184b8d93c6168d1ad0451152af97df34e035c0b6')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_reddit" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_reddit"
}
