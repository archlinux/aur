# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Plugin for Nextcloud to create hashes of files'
pkgname=('nextcloud-app-checksum')
_appname='checksum'
pkgver=1.0.1
pkgrel=1
arch=('any')
license=('GPL3')
url="https://github.com/westberliner/checksum"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_appname}.tar.gz")
sha512sums=('ed25f232e1909b306229c559935281c15af10fafe0d912f1d98ad038da244e48b233d6b98da69d4dbfb690a6c74e33da76d79725dfb409eddf6ca9bace29f17e')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
