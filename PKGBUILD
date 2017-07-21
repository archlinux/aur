# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-jsxc
pkgver=3.2.1
pkgrel=1
pkgdesc="XMPP chat for nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/ojsxc"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/jsxc.nextcloud/releases/download/v$pkgver/ojsxc-$pkgver.tar.gz")
sha256sums=('20d6ad0ca74fa1c0eb50dbaa7e62bd6bf96bd794c01478eedf98c4ca4fa0f60d')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/ojsxc ${pkgdir}/usr/share/webapps/nextcloud/apps/ojsxc
}
