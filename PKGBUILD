# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-jsxc
pkgver=3.2.0
pkgrel=1
pkgdesc="XMPP chat for nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/ojsxc"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/jsxc.nextcloud/releases/download/nc12-v$pkgver/ojsxc-$pkgver-nc12.tar.gz")
sha256sums=('966d26c97c1d2e0a197b89070183a086942603323a4bd21fed78e033be9a2d84')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/ojsxc ${pkgdir}/usr/share/webapps/nextcloud/apps/ojsxc
}
