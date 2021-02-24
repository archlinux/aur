# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-gpxpod
pkgver=4.2.7
pkgrel=1
pkgdesc="view gpx tracks"
arch=('any')
url="https://gitlab.com/eneiluj/gpxpod-oc"
license=('GPL')
depends=('nextcloud')
options=('!strip')
#source=("https://gitlab.com/eneiluj/gpxpod-oc/-/archive/v$pkgver/gpxpod-oc-v$pkgver.tar.gz")
source=("https://gitlab.com/eneiluj/gpxpod-oc/-/wikis/uploads/d91a1db49b783c1241722913ed0acb72/gpxpod-$pkgver.tar.gz")
sha256sums=('98cb793eda5a3592ebf8c7f5961c5e8cc04344b6de532d2a79b837360f367d4d')

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	cp -a "${srcdir}"/gpxpod "${pkgdir}"/usr/share/webapps/nextcloud/apps/gpxpod
}
