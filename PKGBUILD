# Maintainer: William Hahn <bill@hahn3.com>

pkgname=nextcloud-app-rainloop
pkgver=6.0.3
pkgrel=1
pkgdesc="RainLoop Webmail for nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/rainloop"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pierre-alain-b/rainloop-nextcloud/releases/download/$pkgver/rainloop.tar.gz")
sha256sums=('3fcc0050000bb179cc548554f277daef559666f43d3ae5a7d3eaabb1e36f9af0')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/rainloop ${pkgdir}/usr/share/webapps/nextcloud/apps/rainloop
  chown -R http:http ${pkgdir}/usr/share/webapps/nextcloud/apps/rainloop
}
