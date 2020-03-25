# Submitter: David Rosenstrauch <darose@darose.net>

pkgname=roundcubemail-plugin-mobile
pkgver=0.4.9
pkgrel=1
pkgdesc='Mobile Plugin and Skin for Roundcube'
arch=('any')
url='https://plugins.roundcube.net/packages/melanie2/mobile'
license=('GPL3')
depends=('roundcubemail' 'roundcubemail-plugin-jquery-mobile')
source=("plugin-0.4.9.tar.gz::https://github.com/messagerie-melanie2/Roundcube-Plugin-Mobile/archive/v0.4.9.tar.gz"
        "skin-0.4.9.tar.gz::https://github.com/messagerie-melanie2/Roundcube-Skin-Melanie2-Larry-Mobile/archive/v0.4.9.tar.gz")
md5sums=('7e3f14f1934cc0bfe5e1a190e46b481e' '5986a30cc54f98942ac196816bf94442')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/Roundcube-Plugin-Mobile-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/mobile"

    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/skins"
    cp -r "${srcdir}/Roundcube-Skin-Melanie2-Larry-Mobile-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/skins/melanie2_larry_mobile"
}
