# Maintainer: Bogomil Vasilev <smirky@smirky.net>

pkgname=roundcubemail-plugin-authres_status
pkgver=0.7.0
pkgrel=1
pkgdesc='Roundcube plugin for checking the Authentication-Results headers that were added by your MTA and displays an icon to show the verification status.'
arch=('any')
url='https://plugins.roundcube.net/#/packages/pimlie/authres_status'
license=('GPL3')
depends=('roundcubemail')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/pimlie/authres_status/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fce5ced295b675d970bc9886c430c73dc14d7b32f322c8432b32ed56597b5c0a')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/authres_status-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/authres_status"
}
