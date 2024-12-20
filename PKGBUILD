# Maintainer: Catty Steve <cattysteve89265 at 163 dot com>
# Contributor: Anty0 <anty150 at gmail dot com>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Draw.io integration for Nextcloud servers'
pkgname=nextcloud-app-drawio
pkgver=3.0.3
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/jgraph/drawio-nextcloud"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("drawio-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/drawio-v${pkgver}.tar.gz")

sha256sums=('3e908e85e83327a4aecb4e34af55f0c56cc12a62fdc648045cb6963ca1a6be51')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/drawio" "${pkgdir}/usr/share/webapps/nextcloud/apps/drawio"
}
