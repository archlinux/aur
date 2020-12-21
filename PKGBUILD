# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgdesc='Nextcloud app that allows admins to pre-generate previews.'
pkgname=('nextcloud-app-previewgenerator')
pkgver=3.1.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/rullzer/previewgenerator"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("previewgenerator-${pkgver}.tar.gz::https://github.com/rullzer/previewgenerator/releases/download/v${pkgver}/previewgenerator.tar.gz")
sha256sums=('4dd0ddccf3eea91a9a2ea641d1aab80735fb82b5fac6e680963d79ffdcddeb74')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/previewgenerator" "${pkgdir}/usr/share/webapps/nextcloud/apps/previewgenerator"
}
