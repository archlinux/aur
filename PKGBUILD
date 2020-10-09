# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-reddit
pkgver=0.0.3
pkgrel=1
pkgdesc="Reddit integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_reddit"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_reddit/releases/download/v${pkgver}/integration_reddit-${pkgver}.tar.gz")
sha512sums=('8772d6030cebc38a76439631069191ea50115ffe6d8be51825e9b41ade6e4b676afdb240ad5a65377334d07726031b05475a1ae5e7210a9bf70dbd77329e76e4')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_reddit" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_reddit"
}
