# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=roundcubemail-plugins-kolab
pkgver=3.2.9
pkgrel=1
pkgdesc=('Kolab Plugins for the Roundcube Webmailer')
arch=('any')
url='http://www.kolab.org'
license=('AGPL3')
depends=('php-ldap' 'roundcubemail' 'php-kolabformat')
optdepends=('roundcubemail-skin-chameleon: Kolab skin for roundcube'
            'pykolab: configuration tool')
source=("http://mirror.kolabsys.com/pub/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e2a96c2e68074e7bf4bd0d7e8224316a3b93bf865d3fb7f2145fbf2004093518')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail"
    cp -r "${srcdir}/${pkgname}-${pkgver}/plugins" "${pkgdir}/usr/share/webapps/roundcubemail/"
}

