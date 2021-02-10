# Maintainer: Anty0 <anty150 at gmail dot com>

pkgdesc='Breeze Dark Theme for Nextcloud based on the Breeze Dark theme made by the KDE Project'
pkgname=('nextcloud-app-breezedark')
_appname='breezedark'
pkgver=20.0.4
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/mwalbeck/nextcloud-breeze-dark"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_appname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}.tar.gz")
sha512sums=('a8dff767e2ffce42895ced04bded7bc45fb71208973110aeae2b0a0fd0feac0c707f9ab765dcebed35572882ec802967e6701fade646caab2e0a9d0c2fabde31')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}"
}
