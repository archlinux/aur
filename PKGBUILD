# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-discourse
pkgver=0.0.3
pkgrel=1
pkgdesc="Discourse integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_discourse"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_discourse/releases/download/v${pkgver}/integration_discourse-${pkgver}.tar.gz")
sha512sums=('3fd5a25b3dc532278ad35995d651028ef18d22f7944b1f1e90aa861810d7417945f7e1c31352a4e78647a48c2d143f1a5a5d797f34dbf596e8053584a4c7920c')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_discourse" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_discourse"
}
