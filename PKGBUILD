# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=roundcubemail-plugins-kolab
pkgver=3.3.0
pkgrel=1
pkgdesc='Kolab Plugins for the Roundcube Webmailer'
arch=('any')
url='http://www.kolab.org'
license=('AGPL3')
depends=('php-ldap' 'roundcubemail' 'php-kolabformat')
optdepends=('roundcubemail-skin-chameleon: Kolab skin for roundcube'
            'pykolab: configuration tool')
source=("https://mirror.kolabenterprise.com/pub/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a003bc8ca83bcf744fdb0e4c852cfce4aa9415bf0fcd4e79c80301c5bf08408c')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail"
    cp -r "${srcdir}/${pkgname}-${pkgver}/plugins" "${pkgdir}/usr/share/webapps/roundcubemail/"
}

