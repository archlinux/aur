# Maintainer: William Hahn <bill@hahn3.com>

pkgname=owncloud-app-rainloop
pkgver=1.10.3
pkgrel=1
pkgdesc="RainLoop Webmail for owncloud"
arch=('any')
url="http://www.rainloop.net"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.zip::http://repository.rainloop.net/v2/other/owncloud/rainloop.zip")
md5sums=('caeac51d0af8929b738c6a6240e88499')

package() {
  install -m 0755 -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/rainloop ${pkgdir}/usr/share/webapps/owncloud/apps/rainloop
  chown -R http:http ${pkgdir}/usr/share/webapps/owncloud/apps/rainloop
}
