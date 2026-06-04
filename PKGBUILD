# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-tables
pkgver=2.2.0
pkgrel=1
pkgdesc="Tables app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/tables"
license=('AGPL3')
depends=('nextcloud')
source=("https://github.com/nextcloud-releases/tables/releases/download/v$pkgver/tables-v$pkgver.tar.gz")
sha512sums=('a52aad1d2dd42726381b728cd1518be6b21f1abbab40d017d5173c0c27ee44d52bd8db7e2c73afaae9392271ebab1a0f82e99d743a0337d00c021559163ae790')

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cp -a "${srcdir}/tables" "${pkgdir}/usr/share/webapps/nextcloud/apps/"
}
