# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A Nextcloud server app providing digital sticky notes to users.'
pkgname=('nextcloud-app-carnet')
pkgver=0.16.2
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/PhieF/CarnetNextcloud"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("carnet-nc-${pkgver}.tar.gz::https://github.com/PhieF/CarnetNextcloud/releases/download/v${pkgver}/carnet-nc-v${pkgver}.tar.gz")

md5sums=('7939077daaa6131841d13837bd6f101b')
sha256sums=('f9881eba64b281196665622dbcba4d1bba0c9aceb3de65fbae019e6d31f2d476')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/carnet" "${pkgdir}/usr/share/webapps/nextcloud/apps/carnet"
}
