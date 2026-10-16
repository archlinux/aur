# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-tables
pkgver=2.3.2
pkgrel=1
pkgdesc="Tables app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/tables"
license=('AGPL3')
depends=('nextcloud')
source=("https://github.com/nextcloud-releases/tables/releases/download/v$pkgver/tables-v$pkgver.tar.gz")
sha512sums=('a5c68b0bed1dfcbeba38162ad5a55110db102facde522fc1241cc04ef42c5425c3fab6500e867e7d2f9e63fde959eddbc93af699f2fbccdd0f5bb2628600103e')

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cp -a "${srcdir}/tables" "${pkgdir}/usr/share/webapps/nextcloud/apps/"
}
