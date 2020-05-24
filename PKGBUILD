# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A Nextcloud server app providing digital sticky notes to users.'
pkgname=nextcloud-app-carnet
pkgver=0.22.0
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

sha256sums=('3f71ffbdac007491386cd9e9ea93cd8262280cd5046fd1bfae4afcb6f155f4a1')
