# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='A Nextcloud app that provides previews for camera RAW images'
pkgname=('nextcloud-app-camerarawpreviews')
_appname='camerarawpreviews'
pkgver=0.7.10
pkgrel=2
arch=('any')
license=('AGPL3')
_repo="ariselseng/camerarawpreviews"
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip' 'staticlibs' '!purge')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}_nextcloud.tar.gz")
sha512sums=('c33fa14863ca62490721388723bf03574775d0533434199d85c9d15abf3af9d9af61a5089d2c069065944802d62da2dd15319254923ae82a6e19aaa307ce2ce0')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
