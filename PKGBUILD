# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-tables
pkgver=0.9.0
pkgrel=1
pkgdesc="Tables app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/tables"
license=('AGPL3')
depends=('nextcloud')
source=("https://github.com/nextcloud-releases/tables/releases/download/v$pkgver/tables-v$pkgver.tar.gz")
sha512sums=('9a268df35f35646d66c86063682fd9256be160f5c37992b912182d1ad950800341f476a2e00d83e7c32784ff09721fb553655ece2121373be64ac3de99c911e9')

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cp -a "${srcdir}/tables" "${pkgdir}/usr/share/webapps/nextcloud/apps/"
}
