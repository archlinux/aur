# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgdesc='Nextcloud app to enable sorting inside the app menu.'
pkgname=('nextcloud-app-apporder')
pkgver=0.12.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/juliushaertl/apporder"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("apporder-${pkgver}.tar.gz::https://github.com/juliushaertl/apporder/releases/download/v${pkgver}/apporder.tar.gz")
sha256sums=('0f402770ea5c742f233de1d6e95625faf94b9954b5258e7fc0d8080d2bcd4588')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/apporder" "${pkgdir}/usr/share/webapps/nextcloud/apps/apporder"
}
