# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Easy to use yet feature-rich and secure password manager for Nextcloud'
pkgname=('nextcloud-app-passwords')
_appname='passwords'
_jobid='11555'
pkgver=2021.1.3
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://apps.nextcloud.com/apps/passwords"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::https://git.mdns.eu/nextcloud/passwords/-/jobs/${_jobid}/artifacts/raw/${_appname}.tar.gz")
sha512sums=('e04f2a9a6d68a0183c3d4f6984a767b4aa4e7865ba6bea7f9c898a21d5909e876a6230e524008d87d357d28771c67a33959793f2418d0ac12351d54328a8b788')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
