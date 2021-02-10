# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Dropbox integration into Nextcloud'
pkgname=('nextcloud-app-integration-dropbox')
_appname='integration_dropbox'
pkgver=0.0.17
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/eneiluj/integration_dropbox"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.tar.gz")
sha512sums=('e931facbcb760ea806ed2931de0ab1eaac1af70ef7df895a8da8692bc1516713e242d355cff5fcfced7af1aacfa628d6d1b9a3041e7c3da059156262b5bf902e')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
