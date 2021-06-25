# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgdesc='Nextcloud app to enable sorting inside the app menu.'
pkgname=('nextcloud-app-apporder')
pkgver=0.13.0
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/juliushaertl/apporder"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("apporder-${pkgver}.tar.gz::https://github.com/juliushaertl/apporder/releases/download/v${pkgver}/apporder.tar.gz")
sha256sums=('452b34633bb07b1f334db0238930d327c243fa77ffbc63c940b0b25e4c8ccabe')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/apporder" "${pkgdir}/usr/share/webapps/nextcloud/apps/apporder"
}
