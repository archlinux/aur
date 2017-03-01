# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-mozilla_sync
pkgver=1.4
pkgrel=1
pkgdesc="Mozilla Sync server for nextcloud"
arch=('any')
url="https://apps.owncloud.com/content/show.php/Mozilla+Sync?content=161793"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloudarchive/mozilla_sync/archive/v$pkgver.tar.gz")
sha256sums=('314621c290daee93429d881e78d8cae13faaca3205b23860f06450633c5c3b6a')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/mozilla_sync-$pkgver ${pkgdir}/usr/share/webapps/nextcloud/apps/mozilla_sync
}
