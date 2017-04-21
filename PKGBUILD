# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-keeweb
pkgver=0.3.1
pkgrel=1
pkgdesc="Open Keepass stores inside Nextcloud"
arch=('any')
url="https://github.com/jhass/nextcloud-keeweb"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/jhass/nextcloud-keeweb/releases/download/v${pkgver}/keeweb-${pkgver}.tar.gz")
sha512sums=("dba09c655b13465828f17cabda59cc0e6cf85700a706172bbb87f53f1d3dcd4c08c940e83d9ee360fe9f3ccbe5d61cc54c6022a8df5f915056ecdcb0a2d036a2")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/keeweb" "${pkgdir}/usr/share/webapps/nextcloud/apps/keeweb"
}
