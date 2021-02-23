# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Easy to use yet feature-rich and secure password manager for Nextcloud'
pkgname=('nextcloud-app-passwords')
_appname='passwords'
_jobid='11640'
pkgver='2021.2.0'
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://apps.nextcloud.com/apps/passwords"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::https://git.mdns.eu/nextcloud/passwords/-/jobs/${_jobid}/artifacts/raw/${_appname}.tar.gz")
sha512sums=('ebd782b7bb35d97b4c132ee8097d321cad8789bf31f6de30e732fb60be23e91e77b286c49a0f38993b7435a3d2d3ab38fc3654027888466e2a472fc511863173')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
