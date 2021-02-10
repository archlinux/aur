# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='GitHub integration in Nextcloud'
pkgname=('nextcloud-app-integration-github')
_appname='integration_github'
pkgver=0.0.18
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/nextcloud/integration_github"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.tar.gz")
sha512sums=('08e136091f40aec3432fae8cf95ee9511380dd271d6fb546acbb6960a1ca240e254f39cb7170b43283f66d2cd68b5c51fd458ee569199123ee18556ffce816bb')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
