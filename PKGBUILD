# Submitter: David Rosenstrauch <darose@darose.net>

pkgname=roundcubemail-plugin-jquery-mobile
pkgver=1.2
pkgrel=1
pkgdesc='Add Jquery Mobile to Roundcube (used by mobile plugin)'
arch=('any')
url='https://plugins.roundcube.net/packages/melanie2/jquery_mobile'
license=('GPL3')
depends=('roundcubemail')
source=("https://github.com/messagerie-melanie2/Roundcube-Plugin-JQuery-Mobile/archive/v1.2.tar.gz")
md5sums=('0985b5ea24e6de23a1b5a4e0d8a1d106')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/Roundcube-Plugin-JQuery-Mobile-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/jquery_mobile"
}
