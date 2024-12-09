# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-tables
pkgver=0.8.1
pkgrel=1
pkgdesc="Tables app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/tables"
license=('AGPL3')
depends=('nextcloud')
source=("https://github.com/nextcloud-releases/tables/releases/download/v$pkgver/tables-v$pkgver.tar.gz")
sha512sums=('90c81fb7da7e5b9f125c6fd5b19aa21927fd12974a7652700fba9b963435b46e1a38f81d899d9831f796d663c6e9227b1fb24618b61eeba098a2e7c370b2b5bf')

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cp -a "${srcdir}/tables" "${pkgdir}/usr/share/webapps/nextcloud/apps/"
}
