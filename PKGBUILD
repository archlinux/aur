# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgdesc='Nextcloud app to enable sorting inside the app menu.'
pkgname=('nextcloud-app-apporder')
pkgver=0.10.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/juliushaertl/apporder"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("apporder-${pkgver}.tar.gz::https://github.com/juliushaertl/apporder/releases/download/v${pkgver}/apporder.tar.gz")
sha256sums=('d8bd5fbbc26655257e8af3c2bc5fb0eec23a7312aad32c6e5b0bf89e29ce1668')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/apporder" "${pkgdir}/usr/share/webapps/nextcloud/apps/apporder"
}
