# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Google integration in Nextcloud'
pkgname=('nextcloud-app-integration-google')
_appname='integration_google'
pkgver='0.1.10'
pkgrel=1
arch=('any')
license=('AGPL3')
_repo="nextcloud/integration_google"
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.tar.gz")
sha512sums=('f697fec89c3a1b4d30001307c23b22127b3301542c32d9c874e6256af5b518085685d69cd996da99c3d42d11d44197f18b1c1df240bf6d57c11e668da406255f')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
