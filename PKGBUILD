# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Breeze Dark Theme for Nextcloud based on the Breeze Dark theme made by the KDE Project'
pkgname=('nextcloud-app-breezedark')
_appname='breezedark'
pkgver='21.0.2'
pkgrel=1
arch=('any')
license=('AGPL3')
_repo="mwalbeck/nextcloud-breeze-dark"
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}.tar.gz")
sha512sums=('158e2b69ff3b2bebdc2b01f38932864c063a235369df27772e869379229697e55f2e023e4b5071cf0bd4b507a4707510c0ae69bd42fdefff891e1983830cd868')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
