# Maintainer: Catty Steve <cattysteve89265 at 163 dot com>
# Contributor: Anty0 <anty150 at gmail dot com>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Draw.io integration for Nextcloud servers'
pkgname=nextcloud-app-drawio
pkgver=2.0.2
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/jgraph/drawio-nextcloud"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("drawio-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/drawio-v${pkgver}.tar.gz")

sha256sums=('83422fddf176705e3a709cc65673eb7b0a3820d196e709896b7f72da990b64c3')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/drawio" "${pkgdir}/usr/share/webapps/nextcloud/apps/drawio"
}
