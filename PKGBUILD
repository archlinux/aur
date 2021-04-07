# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-gpxpod
pkgver=4.2.8
pkgrel=1
pkgdesc="view gpx tracks"
arch=('any')
url="https://gitlab.com/eneiluj/gpxpod-oc"
license=('GPL')
depends=('nextcloud')
options=('!strip')
#source=("https://gitlab.com/eneiluj/gpxpod-oc/-/archive/v$pkgver/gpxpod-oc-v$pkgver.tar.gz")
source=("https://gitlab.com/eneiluj/gpxpod-oc/-/wikis/uploads/630aee117900664644669890e6693383/gpxpod-$pkgver.tar.gz")
sha256sums=('84165aafbb61436a34741b6bbffe5b9328ad42bc17134d0167ee75fe470987ec')

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	cp -a "${srcdir}"/gpxpod "${pkgdir}"/usr/share/webapps/nextcloud/apps/gpxpod
}
