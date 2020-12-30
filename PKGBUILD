# Submitter: Bogomil Vasilev <smirky@smirky.net>

pkgname=roundcubemail-plugin-authres_status
pkgver=0.6.2
pkgrel=1
pkgdesc='Roundcube plugin for checking the Authentication-Results headers that were added by your MTA and displays an icon to show the verification status.'
arch=('any')
url='https://plugins.roundcube.net/#/packages/pimlie/authres_status'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/pimlie/authres_status/archive/v${pkgver}.tar.gz")
sha256sums=('6679189236ff9e4cf528c6db75c6961568ed2242926852d12837d1d90fb33d13')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/authres_status-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/authres_status"
}
