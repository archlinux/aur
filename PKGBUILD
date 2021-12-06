# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgdesc='Nextcloud app that allows admins to pre-generate previews.'
pkgname=('nextcloud-app-previewgenerator')
pkgver=3.4.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/nextcloud/previewgenerator"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("previewgenerator-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b43a2c3332eeb13cfeb9e8a8a9dcd64d793d90870f518c0068c5d9268679a6e5')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/previewgenerator-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/previewgenerator"
}
