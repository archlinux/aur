# Maintainer: Pig2014 <cattysteve89265 at 163 dot com>
# Contributor: Anty0 <anty150 at gmail dot com>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>




pkgdesc='Draw.io integration for Nextcloud servers'
pkgname=nextcloud-app-drawio
pkgver=1.0.3
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/pawelrojek/nextcloud-drawio"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("drawio-v${pkgver}.tar.gz::${url}/releases/download/v.1.0.3/drawio-v${pkgver}.tar.gz")

sha256sums=('dd4f8d6e465710b1252af7e38e91f211e08a7c6884696c9c15e7b811c75cc059')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/drawio" "${pkgdir}/usr/share/webapps/nextcloud/apps/drawio"
}
