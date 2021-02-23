# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='GitLab integration into Nextcloud'
pkgname=('nextcloud-app-integration-gitlab')
_appname='integration_gitlab'
pkgver='0.0.15'
pkgrel=1
arch=('any')
license=('AGPL3')
_repo="nextcloud/integration_gitlab"
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.tar.gz")
sha512sums=('881e54cbaff3b579d02ed4eac11179a6d25b924d004afed7973d9cc9efc34199350d613658f243f330f0cdab3e957522bb285e701f2d34b8d11f524d78db8288')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
