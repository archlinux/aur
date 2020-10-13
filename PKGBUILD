# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-discourse
pkgver=0.0.4
pkgrel=1
pkgdesc="Discourse integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_discourse"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_discourse/releases/download/v${pkgver}/integration_discourse-${pkgver}.tar.gz")
sha512sums=('878611cae1ef602e0fcc59095973ff3493ff1af4236563c32f5f3455fd89fb4aa07eafe62fce76fa34c225ffb78ce0d0b32779e862d1b1dcf35f9d67188d72ac')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_discourse" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_discourse"
}
