# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-jsxc
pkgver=4.3.1
pkgrel=1
pkgdesc="XMPP chat for nextcloud"
arch=('any')
url="https://github.com/nextcloud/jsxc.nextcloud"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/jsxc.nextcloud/releases/download/v$pkgver/ojsxc-$pkgver.tar.gz")
sha256sums=('936b1675fd1eee41c9b31f38fb820d3b2e93fe59e4a0b6ba74aa4037a2464132')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/ojsxc ${pkgdir}/usr/share/webapps/nextcloud/apps/ojsxc
}
