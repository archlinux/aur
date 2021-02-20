# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-discourse
pkgver=0.0.9
pkgrel=1
pkgdesc="Discourse integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_discourse"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_discourse/releases/download/v${pkgver}/integration_discourse-${pkgver}.tar.gz")
sha512sums=('6f48074d5dc0e5e4134abc192f088ea230260d94007c3a8fefbdb163f26a284d37052d84752cc158dd3836cb88720d25fd62b12f24f7c7dc879a1bd0cbba5e01')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_discourse" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_discourse"
}
