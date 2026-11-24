# Maintainer: Bogomil Vasilev <smirky@smirky.net>

pkgname=roundcubemail-plugin-authres_status
pkgver=0.7.2
pkgrel=1
pkgdesc='Roundcube plugin for checking the Authentication-Results headers that were added by your MTA and displays an icon to show the verification status.'
arch=('any')
url='https://plugins.roundcube.net/#/packages/pimlie/authres_status'
license=('GPL3')
depends=('roundcubemail')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/pimlie/authres_status/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('947a0d744ba980e1c1304de87237b3a9b19e5bb0595aa32ab7d413dff376f0fd')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/authres_status-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/authres_status"
}
