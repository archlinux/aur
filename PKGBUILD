# Maintainer: William Hahn <bill@hahn3.com>

pkgname=owncloud-app-rainloop
pkgver=1.9.3
pkgrel=2
pkgdesc="RainLoop Webmail for owncloud"
arch=('any')
url="http://www.rainloop.net"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.zip::http://repository.rainloop.net/v2/other/owncloud/rainloop.zip")
md5sums=('642513023170f28fe0b5e5477ac86d7c')

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/rainloop ${pkgdir}/usr/share/webapps/owncloud/apps/rainloop
  chown -R http:http ${pkgdir}/usr/share/webapps/owncloud/apps/rainloop
}
