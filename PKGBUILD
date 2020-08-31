# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgdesc='Nextcloud app that allows admins to pre-generate previews.'
pkgname=('nextcloud-app-previewgenerator')
pkgver=3.0.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/rullzer/previewgenerator"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("previewgenerator-${pkgver}.tar.gz::https://github.com/rullzer/previewgenerator/releases/download/v${pkgver}/previewgenerator.tar.gz")
sha256sums=('bafd660d11a7d7ac4fa93b3f152839c34396d5d7b83966d7e7f0f836d8f20a9e')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/previewgenerator" "${pkgdir}/usr/share/webapps/nextcloud/apps/previewgenerator"
}
