# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Breeze Dark Theme for Nextcloud based on the Breeze Dark theme made by the KDE Project'
pkgname=('nextcloud-app-breezedark')
_appname='breezedark'
pkgver='21.0.0'
pkgrel=1
arch=('any')
license=('AGPL3')
_repo="mwalbeck/nextcloud-breeze-dark"
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}.tar.gz")
sha512sums=('d787d3854aff20199a3dc895fde06ac6407323a81d9843a7fd42874e7b0b9743807c0e514adcf60c18165a39c68784c650d47e5786d4c79cbbcff28e141aca5a')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
