# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Breeze Dark Theme for Nextcloud based on the Breeze Dark theme made by the KDE Project'
pkgname=('nextcloud-app-breezedark')
_appname='breezedark'
pkgver='21.0.1'
pkgrel=1
arch=('any')
license=('AGPL3')
_repo="mwalbeck/nextcloud-breeze-dark"
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}.tar.gz")
sha512sums=('6a12e58334f2c5888d1428705fce982a98c045ddfde56061877bd1f4797a63b8d6e065aab355d8f32595eb5fdfd7f59fc01f095496172d8c67c48eaaa72b6710')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
