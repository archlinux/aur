# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=owncloud-app-roundcube
pkgver=2.6.1_build429
pkgrel=1
pkgdesc="Roundcubemail integration for owncloud"
arch=('any')
url="http://apps.owncloud.com/content/show.php/?content=151523"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.zip::https://apps.owncloud.com/CONTENT/content-files/151523-roundcube_v$pkgver.zip")
md5sums=('c2b7466a7f335cedd4a6fa593e17cf90')

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/roundcube ${pkgdir}/usr/share/webapps/owncloud/apps/roundcube
}
