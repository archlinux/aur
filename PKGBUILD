# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=owncloud-app-roundcube
pkgver=2.6.0.306
pkgrel=1
pkgdesc="Roundcubemail integration for owncloud"
arch=('any')
url="http://apps.owncloud.com/content/show.php/?content=151523"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
#source=("$pkgname-$pkgver.zip::https://github.com/hypery2k/owncloud/archive/v$pkgver/roundcube.tar.gz")
#source=("$pkgname-$pkgver.zip::https://apps.owncloud.com/CONTENT/content-files/151523-roundcube_v$pkgver.zip")
source=("$pkgname-$pkgver.zip::https://apps.owncloud.com/CONTENT/content-files/151523-roundcube_v$pkgver.zip")
md5sums=('8df716a01ac3e0f576f266ae8763e016')

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/roundcube ${pkgdir}/usr/share/webapps/owncloud/apps/roundcube
}
