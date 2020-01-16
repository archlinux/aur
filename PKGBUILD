# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-gpxpod
pkgver=4.1.0
pkgrel=1
pkgdesc="view gpx tracks"
arch=('any')
url="https://gitlab.com/eneiluj/gpxpod-oc"
license=('GPL')
depends=('nextcloud')
options=('!strip')
source=("https://gitlab.com/eneiluj/gpxpod-oc/-/archive/v$pkgver/gpxpod-oc-v$pkgver.tar.gz")
sha256sums=('fd9e9aaaa8a273d4e944ad1bbd1c63fddafdf9f90517731531cfcdac3eb267bd')

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	cp -a "${srcdir}"/gpxpod-oc-v$pkgver "${pkgdir}"/usr/share/webapps/nextcloud/apps/gpxpod
}
