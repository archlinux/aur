# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-maps
pkgver=0.1.8
pkgrel=1
pkgdesc="OpenStreetMap layers including POIs"
arch=('any')
url="https://github.com/nextcloud/maps"
license=('GPL')
depends=('nextcloud')
options=('!strip')
source=("https://github.com/nextcloud/maps/releases/download/v$pkgver/maps-$pkgver.tar.gz")
sha256sums=('d7ffb425fa0f11d2c3b7cad857eca258c94d635d77663fe524a6e6bff5416c41')

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	cp -r "${srcdir}"/maps "${pkgdir}"/usr/share/webapps/nextcloud/apps/
}
