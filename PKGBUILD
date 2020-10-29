# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-discourse
pkgver=0.0.5
pkgrel=1
pkgdesc="Discourse integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_discourse"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_discourse/releases/download/v${pkgver}/integration_discourse-${pkgver}.tar.gz")
sha512sums=('5fb73766081d4d7c05c37bf8f6163ae35bc30d2851337009045f5f09fd031263a8e256ac1e8c636c9d33ca3317c7e98f34465e74d55e86202b057eae2501ee3c')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_discourse" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_discourse"
}
