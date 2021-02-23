# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Dropbox integration into Nextcloud'
pkgname=('nextcloud-app-integration-dropbox')
_appname='integration_dropbox'
pkgver='0.0.18'
pkgrel=1
arch=('any')
license=('AGPL3')
_repo="eneiluj/integration_dropbox"
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.tar.gz")
sha512sums=('025c3fb49046569a79a56b53a5933ec109015fc224b406846fb8b793531cfc79bdf9def11d67e61eb0fabbd45de2ed3ce03f5f0d67e56fa716b4e017201eef80')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
