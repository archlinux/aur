# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-gpxpod
pkgver=4.2.2
pkgrel=2
pkgdesc="view gpx tracks"
arch=('any')
url="https://gitlab.com/eneiluj/gpxpod-oc"
license=('GPL')
depends=('nextcloud')
options=('!strip')
#source=("https://gitlab.com/eneiluj/gpxpod-oc/-/archive/v$pkgver/gpxpod-oc-v$pkgver.tar.gz")
source=("https://gitlab.com/eneiluj/gpxpod-oc/-/wikis/uploads/2b929123c8dbcd01a561598397c7a67f/gpxpod-$pkgver.tar.gz")
sha256sums=('438f8d3de405ac09908b7d11f2a78bcee810b1bd94627f77c6d8868c0603a10b')

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	cp -a "${srcdir}"/gpxpod "${pkgdir}"/usr/share/webapps/nextcloud/apps/gpxpod
}
