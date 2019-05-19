# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A Nextcloud server app providing digital sticky notes to users.'
pkgname=('nextcloud-app-carnet')
pkgver=0.15.6
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/PhieF/CarnetNextcloud"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("carnet-nc-${pkgver}.tar.gz::https://github.com/PhieF/CarnetNextcloud/releases/download/v${pkgver}/carnet-nc-v${pkgver}.tar.gz")

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/carnet" "${pkgdir}/usr/share/webapps/nextcloud/apps/carnet"
}
md5sums=('8a250a8220683bbe361f3a26923b3467')
