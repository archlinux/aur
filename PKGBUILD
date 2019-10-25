# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A Nextcloud server app providing digital sticky notes to users.'
pkgname=('nextcloud-app-carnet')
pkgver=0.18.5
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/PhieF/CarnetNextcloud"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("carnet-nc-${pkgver}.tar.gz::https://github.com/PhieF/CarnetNextcloud/releases/download/v${pkgver}/carnet-nc-v${pkgver}.tar.gz")
sha256sums=('f7559eaf899c77bceef46451617862bf43f95e77561ff847a95ec119065823f7')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/carnet" "${pkgdir}/usr/share/webapps/nextcloud/apps/carnet"
}
