# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgdesc='Nextcloud app to enable sorting inside the app menu.'
pkgname=('nextcloud-app-apporder')
pkgver=0.11.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/juliushaertl/apporder"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("apporder-${pkgver}.tar.gz::https://github.com/juliushaertl/apporder/releases/download/v${pkgver}/apporder.tar.gz")
sha256sums=('2a7596fc21121c22bec0d96a649df1232b4b44b9bd59e17f4a1004416509a410')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/apporder" "${pkgdir}/usr/share/webapps/nextcloud/apps/apporder"
}
