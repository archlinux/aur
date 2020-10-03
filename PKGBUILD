# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-gpxpod
pkgver=4.2.3
pkgrel=2
pkgdesc="view gpx tracks"
arch=('any')
url="https://gitlab.com/eneiluj/gpxpod-oc"
license=('GPL')
depends=('nextcloud')
options=('!strip')
#source=("https://gitlab.com/eneiluj/gpxpod-oc/-/archive/v$pkgver/gpxpod-oc-v$pkgver.tar.gz")
source=("https://gitlab.com/eneiluj/gpxpod-oc/-/wikis/uploads/c83556d221f75f01569dd5c5c3f5588e/gpxpod-$pkgver.tar.gz")
sha256sums=('454f279574f02803e784d7fd0c96a2bf0717de2e0b2f12133f0c2ae162ba01b3')

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	cp -a "${srcdir}"/gpxpod "${pkgdir}"/usr/share/webapps/nextcloud/apps/gpxpod
}
