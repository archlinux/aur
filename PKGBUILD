# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgdesc='Nextcloud app to enable sorting inside the app menu.'
pkgname=('nextcloud-app-apporder')
pkgver=0.15.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/juliushaertl/apporder"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("apporder-${pkgver}.tar.gz::https://github.com/juliushaertl/apporder/releases/download/v${pkgver}/apporder.tar.gz")
sha256sums=('a77556c5360308ed8d78fabaa0b33cb4156a624be807b8adab1a7b219c060e71')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/apporder" "${pkgdir}/usr/share/webapps/nextcloud/apps/apporder"
}
