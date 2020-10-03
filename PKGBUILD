# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgdesc='Nextcloud app that allows admins to pre-generate previews.'
pkgname=('nextcloud-app-previewgenerator')
pkgver=3.0.1
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/rullzer/previewgenerator"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("previewgenerator-${pkgver}.tar.gz::https://github.com/rullzer/previewgenerator/releases/download/v${pkgver}/previewgenerator.tar.gz")
sha256sums=('032564b5c217c270305eab69e0ebf7a1005b72e14893d5b7ed829b8226014eec')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/previewgenerator" "${pkgdir}/usr/share/webapps/nextcloud/apps/previewgenerator"
}
