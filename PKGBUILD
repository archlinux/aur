# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Draw.io integration for Nextcloud servers'
pkgname=('nextcloud-app-drawio')
pkgver=0.9.3
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/pawelrojek/nextcloud-drawio"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("drawio-v${pkgver}.tar.gz::https://github.com/pawelrojek/nextcloud-drawio/releases/download/${pkgver}/drawio-v${pkgver}.tar.gz")

sha512sums=('7518ce6e9dfdb8a630a3509cf42991573217bab027d18f732ed7cd8e5bc64489175a22d34397a0d25673a5b993a703d39d92ac039061f87473a6ee91361f8e02')
sha256sums=('4b1a2c5e5b3faf3b22c2d4b19b390d3670e5af76001782bffd2e208c89e20535') 
md5sums=('92c0977f3b8001d108e60741711aa0f3') 

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/drawio" "${pkgdir}/usr/share/webapps/nextcloud/apps/drawio"
}

