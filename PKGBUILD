# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Nextcloud app that implement a basic facial recognition system'
pkgname=('nextcloud-app-facerecognition')
_appname='facerecognition'
pkgver=0.7.2
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/matiasdelellis/facerecognition"
makedepends=()
depends=('nextcloud' 'php-pdlib')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}.tar.gz")
sha512sums=('dba2369f165d04487d17cd2242963cf6f028c452b60d94e15552bceabcb03c19bc9c6b8bc13250951301db77a8aed29dd194c4ec8443bd6668a731fc23c6e0bd')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
