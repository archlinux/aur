# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-spreed
pkgver=3.0.1
pkgrel=1
pkgdesc="Video- and audio-conferencing app for Nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/spreed"
license=('GPL')
depends=('nextcloud>=13.0.0')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/spreed/releases/download/v$pkgver/spreed-$pkgver.tar.gz")
sha256sums=('25c82fc23fa9c99b32237f7b88ca5fc1601510adcf9b3c9051a1db68dd385b3d')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/spreed ${pkgdir}/usr/share/webapps/nextcloud/apps/spreed
}
