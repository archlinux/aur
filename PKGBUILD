# Maintainer: Bogomil Vasilev <smirky@smirky.net>

pkgname=roundcubemail-plugin-authres_status
pkgver=0.6.3
pkgrel=1
pkgdesc='Roundcube plugin for checking the Authentication-Results headers that were added by your MTA and displays an icon to show the verification status.'
arch=('any')
url='https://plugins.roundcube.net/#/packages/pimlie/authres_status'
license=('GPL3')
depends=('roundcubemail')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/pimlie/authres_status/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5dfa1f8977312a6ddeb00bd6d66b8ee922979f9ca81df8084e36ac458c3e41d1')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/authres_status-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/authres_status"
}
