# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-maps
pkgver=0.1.6
pkgrel=1
pkgdesc="OpenStreetMap layers including POIs"
arch=('any')
url="https://github.com/nextcloud/maps"
license=('GPL')
depends=('nextcloud')
options=('!strip')
source=("https://github.com/nextcloud/maps/releases/download/v$pkgver/maps-$pkgver.tar.gz")
sha256sums=('33df2a92e80204dd5ca31775eaac6186e94dd76dff54f651f98f86c44c8205fa')

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	cp -r "${srcdir}"/maps "${pkgdir}"/usr/share/webapps/nextcloud/apps/
}
