# Maintainer: Anty0 <anty150 at gmail dot com>
# Contributor: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='Draw.io integration for Nextcloud servers'
pkgname=('nextcloud-app-drawio')
pkgver=0.9.8
pkgrel=1
arch=('any')
license=('AGPL')
url="https://github.com/pawelrojek/nextcloud-drawio"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("drawio-v${pkgver}.tar.gz::https://github.com/pawelrojek/nextcloud-drawio/releases/download/v.${pkgver}/drawio-v${pkgver}.tar.gz")

md5sums=('cd3f03acfbcfe9f4d21ec76c6e5cd3b8')
sha256sums=('6317c7359157863f90dbfc3e406be0bad3494eeddac00ddad501eb35140626c2')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/drawio" "${pkgdir}/usr/share/webapps/nextcloud/apps/drawio"
}
