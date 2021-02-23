# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-whiteboard-integration
pkgver=0.0.12
pkgrel=1
pkgdesc="Modern collaborative whiteboard"
arch=('any')
url="https://apps.nextcloud.com/apps/integration_whiteboard"
license=('GPL')
depends=('nextcloud')
options=('!strip')
source=("https://github.com/nextcloud/integration_whiteboard/releases/download/v$pkgver/integration_whiteboard-$pkgver.tar.gz")
sha256sums=('e5f8e095e8a4262784a6dd478048dfc135c98a8ac8c2c816c82d9a96914a5cc9')

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	cp -r "${srcdir}"/integration_whiteboard "${pkgdir}"/usr/share/webapps/nextcloud/apps/
}
