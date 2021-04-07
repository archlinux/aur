# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-jsxc
pkgver=4.2.1
pkgrel=1
pkgdesc="XMPP chat for nextcloud"
arch=('any')
url="https://github.com/nextcloud/jsxc.nextcloud"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/jsxc.nextcloud/releases/download/v$pkgver/ojsxc-$pkgver.tar.gz")
sha256sums=('2481d9d0639e7603a44ab4235e88e718e366a823bf940022f5e56ab678b9e873')

package() {
  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/ojsxc ${pkgdir}/usr/share/webapps/nextcloud/apps/ojsxc
}
