# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-gpxpod
pkgver=4.2.3
pkgrel=1
pkgdesc="view gpx tracks"
arch=('any')
url="https://gitlab.com/eneiluj/gpxpod-oc"
license=('GPL')
depends=('nextcloud')
options=('!strip')
source=("https://gitlab.com/eneiluj/gpxpod-oc/-/archive/v$pkgver/gpxpod-oc-v$pkgver.tar.gz")
sha256sums=('cdcfa6ee80e6ad1540fa41a43b2a6c6ca75b2d6dfaad90ad244ca1c9cd6bf164')

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	cp -a "${srcdir}"/gpxpod-oc-v$pkgver "${pkgdir}"/usr/share/webapps/nextcloud/apps/gpxpod
}
