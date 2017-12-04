# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-jsxc
pkgver=3.3.2
pkgrel=1
pkgdesc="XMPP chat for nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/ojsxc"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/jsxc.nextcloud/releases/download/v$pkgver/ojsxc-$pkgver.tar.gz")
sha256sums=('63a45851dc20cdde60a60f065bc8f0b9668a38462e4aec10cdb0c39d8090d2d5')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/ojsxc ${pkgdir}/usr/share/webapps/nextcloud/apps/ojsxc
}
