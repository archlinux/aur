# Maintainer: William Hahn <bill@hahn3.com>

pkgname=nextcloud-app-rainloop
pkgver=5.0.6
pkgrel=1
pkgdesc="RainLoop Webmail for nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/rainloop"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.zip::https://github.com/pierre-alain-b/rainloop-nextcloud/releases/download/$pkgver/rainloop.tar.gz")
sha256sums=('0b792eb4b633017d1c62c86c7e0b8120d203d96d85605fca5e6e211ab3981006')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/rainloop ${pkgdir}/usr/share/webapps/nextcloud/apps/rainloop
  chown -R http:http ${pkgdir}/usr/share/webapps/nextcloud/apps/rainloop
}
