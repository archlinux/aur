# Submitter: David Rosenstrauch <darose@darose.net>

pkgname=roundcubemail-plugin-mobile
pkgver=0.4.5
pkgrel=1
pkgdesc='Mobile Plugin and Skin for Roundcube'
arch=('any')
url='https://plugins.roundcube.net/packages/melanie2/mobile'
license=('GPL3')
depends=('roundcubemail' 'roundcubemail-plugin-jquery-mobile')
source=("plugin-0.4.5.tar.gz::https://github.com/messagerie-melanie2/Roundcube-Plugin-Mobile/archive/v0.4.5.tar.gz"
        "skin-0.4.5.tar.gz::https://github.com/messagerie-melanie2/Roundcube-Skin-Melanie2-Larry-Mobile/archive/v0.4.5.tar.gz")
md5sums=('5f0f097beb7a8a14bb6bb0768120284c' '15829ca4359956b8a676d5c27f5e10ac')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/Roundcube-Plugin-Mobile-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/mobile"

    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/skins"
    cp -r "${srcdir}/Roundcube-Skin-Melanie2-Larry-Mobile-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/skins/melanie2_larry_mobile"
}
