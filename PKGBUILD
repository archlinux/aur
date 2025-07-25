# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-tables
pkgver=0.9.5
pkgrel=1
pkgdesc="Tables app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/tables"
license=('AGPL3')
depends=('nextcloud')
source=("https://github.com/nextcloud-releases/tables/releases/download/v$pkgver/tables-v$pkgver.tar.gz")
sha512sums=('9b4a9b6ac93743de3691ea1ff8d97e9674f8ea66d7f52aaf7147345765f92da934c405f0c4cffe9f545153905768afaeb21a873e97db2de9b0908f956d55c1e7')

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cp -a "${srcdir}/tables" "${pkgdir}/usr/share/webapps/nextcloud/apps/"
}
