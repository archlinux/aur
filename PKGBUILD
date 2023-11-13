# Maintainer: Catty Steve <cattysteve89265 at 163 dot com>
# Contributor: Anty0 <anty150 at gmail dot com>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Draw.io integration for Nextcloud servers'
pkgname=nextcloud-app-drawio
pkgver=2.1.4
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/jgraph/drawio-nextcloud"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("drawio-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/drawio-v${pkgver}.tar.gz")

sha256sums=('403edbebe52358d792e19d902dc8017deb485f0a8d9e01515fd16bcb1f749900')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/drawio" "${pkgdir}/usr/share/webapps/nextcloud/apps/drawio"
}
