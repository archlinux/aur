# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Google integration in Nextcloud'
pkgname=('nextcloud-app-integration-google')
_appname='integration_google'
pkgver=0.1.7
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/nextcloud/integration_google"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.tar.gz")
sha512sums=('8a1c60399ba9c59b7f80da0f501ae7b4206d0f824fc963cc702cf10e3ae881cfe481df2e89738d4e021f42c280f8108a0820e115c447d98b8172b7704d0e74be')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
