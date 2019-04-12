# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-jsxc
pkgver=3.4.3
pkgrel=1
pkgdesc="XMPP chat for nextcloud"
arch=('any')
url="https://github.com/nextcloud/jsxc.nextcloud"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/jsxc.nextcloud/releases/download/v$pkgver/ojsxc-$pkgver.tar.gz")
sha256sums=('7ed1accc266cde7c7a952a00a0161f600e0816fd140a8658e2eaa684446988ee')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/ojsxc ${pkgdir}/usr/share/webapps/nextcloud/apps/ojsxc
}
