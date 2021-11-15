# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-whiteboard-integration
pkgver=0.0.14
pkgrel=1
pkgdesc="Modern collaborative whiteboard"
arch=('any')
url="https://apps.nextcloud.com/apps/integration_whiteboard"
license=('GPL')
depends=('nextcloud')
options=('!strip')
source=("https://github.com/nextcloud/integration_whiteboard/releases/download/v$pkgver/integration_whiteboard-$pkgver.tar.gz")
sha256sums=('c25edd018b9d6625ad5259c6b8957efbfb0cdf9035d4b260586e3f8151f6f4ba')

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	cp -r "${srcdir}"/integration_whiteboard "${pkgdir}"/usr/share/webapps/nextcloud/apps/
}
