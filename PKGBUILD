# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Plugin for Nextcloud to create hashes of files'
pkgname=('nextcloud-app-checksum')
_appname='checksum'
pkgver='1.1.1'
pkgrel=1
arch=('any')
license=('GPL3')
_repo="westberliner/checksum"
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}.tar.gz")
sha512sums=('919e8d6a40264372513229fdd3f227c9c1c75c536c427c60af537817a816b3feb13eb5c48c3663f4582f33d9d33587b940b313e74afab6d49ec5dd406889d881')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
