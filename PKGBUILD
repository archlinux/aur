# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-spreed
pkgver=3.2.0
pkgrel=1
pkgdesc="Video- and audio-conferencing app for Nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/spreed"
license=('GPL')
depends=('nextcloud>=13.0.0')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/spreed/releases/download/v$pkgver/spreed-$pkgver.tar.gz")
sha256sums=('a9adf372f95531d1346809ac98e3c8b780e6cc7020fd82ac0f90a24d3d366fbb')

package() {
  install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
  cp -a "${srcdir}"/spreed "${pkgdir}"/usr/share/webapps/nextcloud/apps/spreed
}
