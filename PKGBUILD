# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-maps
pkgver=0.1.4
pkgrel=1
pkgdesc="OpenStreetMap layers including POIs"
arch=('any')
url="https://github.com/nextcloud/maps"
license=('GPL')
depends=('nextcloud')
options=('!strip')
source=("https://github.com/nextcloud/maps/releases/download/v$pkgver/maps-$pkgver.tar.gz")
sha256sums=('e381d609943762bdfb87bdd13c4ba82297e6f7b3b3af434e613fc4df0b5f40b4')

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	cp -r "${srcdir}"/maps "${pkgdir}"/usr/share/webapps/nextcloud/apps/
}
