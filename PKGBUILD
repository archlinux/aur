# Submitter: David Rosenstrauch <darose@darose.net>

pkgname=roundcubemail-plugin-jquery-mobile
pkgver=1.1
pkgrel=1
pkgdesc='Add Jquery Mobile to Roundcube (used by mobile plugin)'
arch=('any')
url='https://plugins.roundcube.net/packages/melanie2/jquery_mobile'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/messagerie-melanie2/Roundcube-Plugin-JQuery-Mobile/archive/v1.1.tar.gz")
md5sums=('f28a8e769d78cd3508b3235d31b2dbde')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/Roundcube-Plugin-JQuery-Mobile-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/jquery_mobile"
}
