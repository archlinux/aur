# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A Nextcloud server app providing digital sticky notes to users.'
pkgname=nextcloud-app-carnet
pkgver=0.22.2
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

sha256sums=('3fd7abdea36fb944af0d1ad9280286bc6e0bddc890bc32d05cef517abf9f2f00')
