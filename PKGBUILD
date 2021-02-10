# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='GitLab integration into Nextcloud'
pkgname=('nextcloud-app-integration-gitlab')
_appname='integration_gitlab'
pkgver=0.0.13
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/nextcloud/integration_gitlab"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.tar.gz")
sha512sums=('b9fec91925d1cd5ff50aa3eadc035d068dc4568d500cec68b22eb68e269899b9b6f5364ebcab497f41dd661976be1ef9713d3b2d24509a9a4e76562c04612333')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
