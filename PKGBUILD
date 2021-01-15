# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-discourse
pkgver=0.0.6
pkgrel=1
pkgdesc="Discourse integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_discourse"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_discourse/releases/download/v${pkgver}/integration_discourse-${pkgver}.tar.gz")
sha512sums=('139dcc598195198a738319e89a6359bd7d83a62897f3f429b54290c927e5840143b57fb2cf2321521ce6afc13cb82603e57ffee873ce0d1442dd8388d4aa3f9a')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_discourse" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_discourse"
}
