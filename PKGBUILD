# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=owncloud-app-mozilla_sync
pkgver=1.4
pkgrel=1
pkgdesc="Mozilla Sync server for owncloud"
arch=('any')
url="http://owncloud.org/"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/mozilla_sync/archive/v$pkgver.tar.gz")
md5sums=('e98fdb10ff4139b4259e2a183a88975a')

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/mozilla_sync-$pkgver ${pkgdir}/usr/share/webapps/owncloud/apps/mozilla_sync
}
