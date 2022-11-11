# Maintainer: Pig2014 <cattysteve89265 at 163 dot com>
# Contributor: Anty0 <anty150 at gmail dot com>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Draw.io integration for Nextcloud servers'
pkgname=nextcloud-app-drawio
pkgver=1.0.4
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/jgraph/drawio-nextcloud"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("drawio-v${pkgver}.tar.gz::${url}/releases/download/v.${pkgver}/drawio-v${pkgver}.tar.gz")

sha256sums=('d3e0b395fa4ef906e977269569c59e4cec9feb7b87c5f3a6a876b528fd127a6c')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/drawio" "${pkgdir}/usr/share/webapps/nextcloud/apps/drawio"
}
