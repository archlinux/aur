# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-spreed
pkgver=2.0.1
pkgrel=1
pkgdesc="spreed.memail integration for nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/spreed"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/spreed/releases/download/v$pkgver/spreed-$pkgver.tar.gz")
sha256sums=('0fdab3e559dc8493a8e608d37093e2005cf286dfec906b4fc8122b3ea9bc7064')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/spreed ${pkgdir}/usr/share/webapps/nextcloud/apps/spreed
}
