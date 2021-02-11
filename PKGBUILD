# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-gpxpod
pkgver=4.2.6
pkgrel=1
pkgdesc="view gpx tracks"
arch=('any')
url="https://gitlab.com/eneiluj/gpxpod-oc"
license=('GPL')
depends=('nextcloud')
options=('!strip')
#source=("https://gitlab.com/eneiluj/gpxpod-oc/-/archive/v$pkgver/gpxpod-oc-v$pkgver.tar.gz")
source=("https://gitlab.com/eneiluj/gpxpod-oc/-/wikis/uploads/d83eb58e98017f24a859e7ab2c268de9/gpxpod-$pkgver.tar.gz")
sha256sums=('f12e09ee8d23a7d6bc079f510b24d3b639b28040652edfe95280b6267c081069')

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	cp -a "${srcdir}"/gpxpod "${pkgdir}"/usr/share/webapps/nextcloud/apps/gpxpod
}
