# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Draw.io integration for Nextcloud servers'
pkgname=('nextcloud-app-drawio')
pkgver=0.9.5
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/pawelrojek/nextcloud-drawio"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("drawio-v${pkgver}.tar.gz::https://github.com/pawelrojek/nextcloud-drawio/releases/download/v.${pkgver}/drawio-v${pkgver}.tar.gz")

md5sums=('6233679c3f008768ba795c198485ace6')
sha256sums=('9d2f5b08ed0dd5813575d9983d7b9c1a315b0adf4a1ec0b4df15aad4dc417fe0')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/drawio" "${pkgdir}/usr/share/webapps/nextcloud/apps/drawio"
}

