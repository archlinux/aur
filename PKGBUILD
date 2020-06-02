# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgdesc='Nextcloud app that allows admins to pre-generate previews.'
pkgname=('nextcloud-app-previewgenerator')
pkgver=2.3.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/rullzer/previewgenerator"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("previewgenerator-${pkgver}.tar.gz::https://github.com/rullzer/previewgenerator/releases/download/v${pkgver}/previewgenerator.tar.gz")
sha256sums=('7776d35d09789b02482aa2839fd393598b239b4cf6dc78dea706b3f15883e01c')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/previewgenerator" "${pkgdir}/usr/share/webapps/nextcloud/apps/previewgenerator"
}
